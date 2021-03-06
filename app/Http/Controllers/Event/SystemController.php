<?php

namespace App\Http\Controllers\Event;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Helpers\SceneHelper;
use Illuminate\Validation\Rule;

use Log;
use Validator;
use Session;
use Mail;

use App\Models\AttrDef;
use App\Models\User;
use App\Models\UserRole;
use App\Models\DivisionValue;
use App\Helpers\ProfileHelper;

use App\Mail\UserRegister;
use App\Mail\UserRegisted;

class SystemController extends Controller {
    const messages = [
        'required' => '入力が必要です。',
    ];

    protected function build_attr_validate_rules(array $attr_defs, array $rules=null, array $division_value_map=null) {
        //区分値マスタを区分ID・区分値IDをキーとした連想配列として取得
        if (!$division_value_map) {
            $division_value_map = DivisionValue::mapByDivisionIdId(['*'], 0);
        }

        if (!$rules) {
            $rules = [];
        }

        //ユーザーカスタム属性のチェック
        foreach ($attr_defs as $attr_def) {
            $rule = [];
            switch ($attr_def->value_type) {
                case 1:     //単行文字列
                case 11:    //複行文字列
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    if (!empty($attr_def->min_length)) {
                        $rule[] = 'min:' . $attr_def->min_length;
                    }
                    if (!empty($attr_def->max_length)) {
                        $rule[] = 'max:' . $attr_def->max_length;
                    }
                    if (!empty($attr_def->regex)) {
                        $rule[] = 'regex:/' . $attr_def->regex . '/';
                    }
                    if (!empty($attr_def->regex_unmatch)) {
                        $rule[] = 'not_regex:/' . $attr_def->regex_unmatch . '/';
                    }
                    break;
                case 2:     //整数
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'integer';
                    if (!empty($attr_def->min_bigint_value)) {
                        $rule[] = 'min:' . $attr_def->min_bigint_value;
                    }
                    if (!empty($attr_def->max_bigint_value)) {
                        $rule[] = 'max:' . $attr_def->max_bigint_value;
                    }
                    break;
                case 3:     //浮動小数
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'numeric';
                    if (!empty($attr_def->min_double_value)) {
                        $rule[] = 'min:' . $attr_def->min_double_value;
                    }
                    if (!empty($attr_def->max_double_value)) {
                        $rule[] = 'max:' . $attr_def->max_double_value;
                    }
                    break;
                case 4:     //日付
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'date';
                    if (!empty($attr_def->start_date)) {
                        $rule[] = 'after_or_equal:' . $attr_def->start_date;
                    }
                    if (!empty($attr_def->end_date)) {
                        $rule[] = 'before_or_equal:' . $attr_def->end_date;
                    }
                    break;
                case 5:     //時刻
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'date_format:H:i';
                    if (!empty($attr_def->start_time)) {
                        $rule[] = 'after_or_equal:' . $attr_def->start_time;
                    }
                    if (!empty($attr_def->end_time)) {
                        $rule[] = 'before_or_equal:' . $attr_def->end_time;
                    }
                    break;
                case 6:     //区分選択肢
                    switch ($attr_def->selector_pattern) {
                        case 1:
                        case 2:
                        case 4:
                            $rule[] = function($attribute, $value, $fail) use($division_value_map, $attr_def) {
                                if ($attr_def->require_flag) {
                                    if (!$value) {
                                        $fail('いずれかを選択してください。');
                                        return;
                                    }
                                }
                                if (!isset($division_value_map[$attr_def->selector_division_id][$value])) {
                                    $fail('いずれかを選択してください。');
                                }
                            };
                            break;
                        case 3:
                        case 5:
                            $rule[] = function($attribute, $value, $fail) use($division_value_map, $attr_def) {
                                if ($attr_def->require_flag) {
                                    if (!$value) {
                                        $fail('いずれかを選択してください。');
                                        return;
                                    }
                                }
                                foreach ($value as $division_id) {
                                    if (!isset($division_value_map[$attr_def->selector_division_id][$division_id])) {
                                        $fail('いずれかを選択してください。');
                                    }
                                }
                            };
                            break;
                    }
                    break;
                case 7:
                    break;
                case 8:
                    break;
                case 9:     //フラグ
                    $rule[] = 'boolean';
                    if ($attr_def->require_flag) {
                        $rule[] = 'same:true';
                    }
                    break;
                case 99:
                    break;
            }

            $rules[$attr_def->id] = $rule;
        }

        return $rules;
    }

    public function login(Request $request) {
        $input = json_decode($request->get('input', '{}'), true);

        $validator = Validator::make($input, [
            'loginId'=>['required'],
            'loginPw'=>['required'],
        ], self::messages);

        if ($validator->fails()) {
            return [ 'status'=>'INVALID', 'messages'=>'入力にエラーがあります。', 'errors'=>$validator->errors() ];
        }

        $loginId = $input['loginId'];
        $loginPw = $input['loginPw'];

        //ログインIDとパスワードに一致する、利用者情報を取得する
        $user = User::rowByLoginIdPassword($loginId, $loginPw);
        if (!$user) {
            return [ 'status'=>'ERROR', 'messages'=>[ 'ログインに失敗しました。' ] ];
        }
        else if (!$user->valid_user) {
            //ログイン試行回数を更新する
            User::inclementToRetryCount($user->id);
            return [ 'status'=>'ERROR', 'messages'=>[ 'ログインに失敗しました。' ] ];
        }
        else if (5 < $user->retry_count) {
            //試行回数オーバー
            return [ 'status'=>'ERROR', 'messages'=>[ 'ログインに失敗しました。' ] ];
        }

        //ロールを取得する
        $user_roles = UserRole::getByUserId($user->id)->toArray();
        $roles = Arr::pluck($user_roles, 'role_id');

        //セッションにログイン者のプロファイルをセットする。
        $profile = ProfileHelper::get();
        $profile['user'] = $user;
        $profile['roles'] = $roles ?: [];
        ProfileHelper::set($profile);

        //最終ログイン日時を更新する
        User::updateLastLoginDtm($user->id);

        return SceneHelper::forward('/scene/top');
    }

    public function logout(Request $request) {
        ProfileHelper::logout();
        return SceneHelper::ok();
    }

    public function user_regist(Request $request) {
        $input = json_decode($request->get('input', '{}'), true);

        $validator = Validator::make($input, [
            'mailAddress'=>['required'],
        ], self::messages);

        if ($validator->fails()) {
            return [ 'status'=>'INVALID', 'messages'=>'入力にエラーがあります。', 'errors'=>$validator->errors() ];
        }

        $users = User::rowByEmail($input['mailAddress']);
        if ($users) {
            return [ 'status'=>'ERROR', 'messages'=>'既にそのメールアドレスは登録済みです。' ];
        }

        $mailAddress = $input['mailAddress'];
        $temporary_regist_id = User::registNew($mailAddress);

        //認証メールの送信
        Mail::to($mailAddress)->send(new UserRegister($temporary_regist_id));

        return SceneHelper::forward('/scene/regist_mail_send', [ 'temporary_regist_id'=>$temporary_regist_id ]);
    }

    public function new_user_check(Request $request) {
        $input = SceneHelper::input($request);

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

        $rules = $this->build_attr_validate_rules($attr_defs, [
            'temporary_regist_id' => [ 'required' ],
            'email' => [ 'required', 'email:rfc,dns' ],
            'password' => [ 'required', 'confirmed' ],
            'password_confirmation' => [ 'required' ],
        ]);

        $validator = Validator::make($input, $rules, self::messages);
        if ($validator->fails()) {
            return SceneHelper::invalid('入力にエラーがあります。', $validator->errors());
        }

        $regist_data = [];
        foreach ($attr_defs as $attr_def) {
            $regist_data[] = [  'id'=>$attr_def->id, 'value'=>$input[$attr_def->id] ];
        }

        $user = User::rowByTempraryRegisterId($input['temporary_regist_id']);
        if (!$user) {
            Log::error('仮会員情報が取得できません。');
            return response('', 400);
        }

        return SceneHelper::forward('/scene/new_user_preview', [
            'temporary_regist_id' => @$input['temporary_regist_id'],
            'user' => $user,
            'email' => $input['email'],
            'password' => $input['password'],
            'regist_data' => $regist_data,
        ]);
    }

    public function new_user_apply(Request $request) {
        $params = SceneHelper::get($request);

        //
        $temporary_regist_id = $params['temporary_regist_id'];
        $user = $params['user'];
        $email = $params['email'];
        $password = $params['password'];
        $regist_data = $params['regist_data'];

        try {
            User::updateByPasswordFromTempraryRegistId($user->id, $temporary_regist_id, $password, $regist_data);
        }
        catch (\Exception $ex) {
            Log::error($ex);
            Log::error($params);
            return [ 'status'=>'ERROR', 'messages'=>'会員情報の登録に失敗しました。' ];
        }

        //ロールを取得する
        $user_roles = UserRole::getByUserId($user->id)->toArray();
        $roles = Arr::pluck($user_roles, 'role_id');

        //セッションにログイン者のプロファイルをセットする。
        $profile = ProfileHelper::get();
        $profile['user'] = $user;
        $profile['roles'] = $roles ?: [];
        ProfileHelper::set($profile);

        //最終ログイン日時を更新する
        User::updateLastLoginDtm($user->id);

        //登録完了メールの送信
        Mail::to($email)->send(new UserRegisted($user->id));

        return SceneHelper::forward('/scene/top');
    }

    public function new_agent_user_check(Request $request) {
        $input = SceneHelper::input($request);

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

        $rules = $this->build_attr_validate_rules($attr_defs, [
            'agent_inquiry_id' => [ 'required' ],
            'email' => [ 'required', 'email:rfc,dns' ],
            'password' => [ 'required', 'confirmed' ],
            'password_confirmation' => [ 'required' ],
        ]);

        $validator = Validator::make($input, $rules, self::messages);
        if ($validator->fails()) {
            return SceneHelper::invalid('入力にエラーがあります。', $validator->errors());
        }

        $email = $input['email'];
        if (User::rowByEmail($email)) {
            return SceneHelper::error('既に会員として登録済みのメールアドレスです。');
        }

        $regist_data = [];
        foreach ($attr_defs as $attr_def) {
            $regist_data[] = [  'id'=>$attr_def->id, 'value'=>$input[$attr_def->id] ];
        }

        return SceneHelper::forward('/scene/new_agent_user_preview', [
            'agent_inquiry_id' => $input['agent_inquiry_id'],
            'email' => $input['email'],
            'password' => $input['password'],
            'agent_apply' => $input['agent_apply'],
            'regist_data' => $regist_data,
        ]);
    }

    public function new_agent_user_apply(Request $request) {
        $params = SceneHelper::get($request);

        //
        $agent_inquiry_id = $params['agent_inquiry_id'];
        $email = $params['email'];
        $password = $params['password'];
        $agent_apply = $params['agent_apply'];
        $regist_data = $params['regist_data'];

        $user_id = null;
        try {
            $user_id = User::updateByPasswordFromAgent($agent_inquiry_id, $email, $password, $agent_apply, $regist_data);
        }
        catch (\Exception $ex) {
            Log::error($ex);
            Log::error($params);
            return [ 'status'=>'ERROR', 'messages'=>'会員情報の登録に失敗しました。' ];
        }

        //ロールを取得する
        $user_roles = UserRole::getByUserId($user_id)->toArray();
        $roles = Arr::pluck($user_roles, 'role_id');

        //セッションにログイン者のプロファイルをセットする。
        $profile = ProfileHelper::get();
        $profile['user'] = User::rowByUserId($user_id);
        $profile['roles'] = $roles ?: [];
        ProfileHelper::set($profile);

        //最終ログイン日時を更新する
        User::updateLastLoginDtm($user_id);

        //登録完了メールの送信
        Mail::to($email)->send(new UserRegisted($user_id));

        return SceneHelper::forward('/scene/top');
    }

}
