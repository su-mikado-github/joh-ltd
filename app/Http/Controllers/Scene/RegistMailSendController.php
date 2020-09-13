<?php

namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use App\Helpers\SceneHelper;

use Illuminate\Http\Request;

use Log;

use App\Models\User;

class RegistMailSendController extends Controller {
    //
    public function index(Request $request) {
        //
        $params = SceneHelper::get($request);
        if (!$params) {
            Log::error('画面パラメータが無効です。');
            return response('', 400);
        }

        $temporary_regist_id = @$params['temporary_regist_id'];
        if (!$temporary_regist_id) {
            Log::error('新規登録会員の仮発行IDが無効です。' . var_export($params, true));
            return response('', 400);
        }

        $user = User::rowByTempraryRegisterId($temporary_regist_id);
        if (!$user) {
            Log::error('仮会員情報が取得できません。' . var_export($params, true));
            return response('', 400);
        }

        Log::info(__FILE__ . '(' . __LINE__ . ') ' . var_export($user, true));
        return view('scene.regist_mail_send_index', [
            'to_address' => $user->email,
        ]);
    }
}
