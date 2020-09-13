<?php

namespace App\Http\Controllers\Event;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Arr;
use App\Helpers\SceneHelper;

use Log;
use Validator;
use Session;
use Mail;

use App\Models\System;
use App\Models\User;
use App\Models\UserRole;
use App\Helpers\ProfileHelper;

use App\Mail\UserRegister;

class SystemController extends Controller {
    const messages = [
        'required' => '入力が必要です。',
    ];

    public function login(Request $request) {
//        Log::info(__FILE__ . '(' . __LINE__ . ') ' . var_export($request, true));
        $validator = Validator::make($request->all(), [
            'loginId'=>['required'],
            'loginPw'=>['required'],
        ], self::messages);

        if ($validator->fails()) {
            return [ 'status'=>'INVALID', 'messages'=>$validator->errors() ];
        }

        $loginId = $request->get('loginId');
        $loginPw = $request->get('loginPw');

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

        return [ 'status'=>'OK', 'url'=>'/scene/top' ];
    }

    public function logout(Request $request) {
        ProfileHelper::logout();
        return [ 'status'=>'OK' ];
    }

    public function user_regist(Request $request) {
        $validator = Validator::make($request->all(), [
            'mailAddress'=>['required'],
        ], self::messages);

        if ($validator->fails()) {
            return [ 'status'=>'INVALID', 'messages'=>$validator->errors() ];
        }

        $mailAddress = $request->get('mailAddress');
        $temporary_regist_id = User::registNew($mailAddress);

        //認証メールの送信
        Mail::to($mailAddress)->send(new UserRegister($temporary_regist_id));

        return [ 'status'=>'OK', 'url'=>SceneHelper::set('/scene/regist_mail_send', [ 'temporary_regist_id'=>$temporary_regist_id ]) ];
    }

    public function new_user(Request $request) {
        //
        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('user');
        
        

        return [ 'status'=>'OK', 'url'=>SceneHelper::set('/scene/new_user_preview', [
            'regist_data' => $regist_data,
        ]) ];
    }
}
