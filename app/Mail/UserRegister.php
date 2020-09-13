<?php

namespace App\Mail;

use App\Models\System;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\Screen;
use App\Models\SystemPolicyValue;

use Log;

class UserRegister extends Mailable {
    use Queueable, SerializesModels;

    protected $temporary_regist_id;

    protected $system;

    protected $system_policy_value;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($temporary_regist_id, $system=null, $system_policy_value=null) {
        //
        $this->temporary_regist_id = $temporary_regist_id;
        $this->system = ($system ?: System::row());
        $this->system_policy_value = ($system_policy_value ?: SystemPolicyValue::rowBySystemPolicyIdSystemPolicyValueId('security', 'regist_mail_expire_minutes'));
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build() {
        //各リンクの取得
        $new_user = Screen::rowByScreenId('new_user');                  //新規会員登録の会員情報入力画面
        $user_regist = Screen::rowByScreenId('user_regist');            //新規会員登録のメール送信画面
        $service_terms = Screen::rowByScreenId('service_terms');        //利用規約

        //有効期限（時間）の取得
//Log::info(__FILE__ . '(' . __LINE__ . ') => ' . var_export($this->system_policy_value, true));
        $expire_hours = ($this->system_policy_value->value ?: 15) / 60;

        //認証メールの送信
        return $this->text('emails.user_register_plain')
            ->subject("会員登録URLのお知らせ〔{$this->system->name}〕")
            ->from($this->system->from_email, $this->system->from_email_name)
            ->bcc([ $this->system->from_email ])
            ->with([
                'system' => $this->system,
                'new_user_url' => $new_user->url . "?" . http_build_query([ 'key'=>$this->temporary_regist_id ]),
                'user_regist_url' => $user_regist->url,
                'service_terms_url' => $service_terms->url,
                'expire_hours' => $expire_hours,
            ]);
        ;
    }
}
