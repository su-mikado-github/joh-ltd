<?php

namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\AttrDef;
use App\Models\SystemPolicyValue;

use Log;

class NewUserController extends Controller {
    //
    public function index(Request $request) {
        //
        $temporary_regist_id = $request->get('key');
        if (!$temporary_regist_id) {
            Log::error('新規登録会員の仮発行IDが指定されていません。');
            return response('', 400);
        }

        $user = User::rowByTempraryRegisterId($temporary_regist_id);
        if (!$user) {
            Log::error('仮会員情報が取得できません。' . var_export($temporary_regist_id, true));
            return response('', 400);
        }

        //システムポリシーを取得
        $system_policy_value = SystemPolicyValue::rowBySystemPolicyIdSystemPolicyValueId('security', 'regist_mail_expire_minutes');
        $expire_minutes = @$system_policy_value->value ?: 15;

        //新規登録メールが有効期限切れになっていないか
        $apply_dtm = strtotime($user->apply_dtm);
        if ($apply_dtm + $expire_minutes * 60 < time()) {
            Log::error('新規会員登録メールの有効期限が切れています。' . var_export($temporary_regist_id, true));
            return response('', 403);
        }

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

        return view('scene.new_user_index', [
            //
            'email'=>$user->email,
            'attr_defs' => $attr_defs,
        ]);
    }
}
