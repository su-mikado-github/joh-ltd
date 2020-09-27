<?php

namespace App\Mail;

use App\Models\Screen;
use App\Models\System;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\User;
use App\Models\UserAttr;

use Log;

class UserRegisted extends Mailable {
    use Queueable, SerializesModels;

    protected $user_id;

    protected $system;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($user_id, $system=null) {
        //
        $this->user_id = $user_id;
        $this->system = ($system ?: System::row());
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build() {
        //各リンクの取得
        $mypage = Screen::rowByScreenId('mypage');                      //マイページ画面
        $free_templates = Screen::rowByScreenId('free_templates');      //無料デザインテンプレート集画面
        $customer_support = Screen::rowByScreenId('customer_support');  //カスタマーサポート画面

        $user = User::rowByUserId($this->user_id);

        $user_attrs = UserAttr::rowsetByUserId($this->user_id);

        //認証メールの送信
        return $this->text('emails.user_registed_plain')
            ->subject("会員登録完了のお知らせ〔{$this->system->name}〕")
            ->from($this->system->from_email, $this->system->from_email_name)
            ->bcc([ $this->system->from_email ])
            ->with([
                'system' => $this->system,
                'mypage_url' => @$mypage->url,
                'free_templates_url' => @$free_templates->url,
                'customer_support_url' => @$customer_support->url,
                'user' => $user,
                'user_attrs' => $user_attrs,
            ]);
        ;
    }
}
