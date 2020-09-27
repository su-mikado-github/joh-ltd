<?php

namespace App\Mail;

use App\Models\Screen;
use App\Models\System;
use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AgentInquiryed extends Mailable {
    use Queueable, SerializesModels;

    protected $agent_inquiry_id;

    protected $company_name;

    protected $charge_person_name;

    protected $system;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($agent_inquiry_id, $company_name, $charge_person_name, $system=null) {
        //
        $this->agent_inquiry_id = $agent_inquiry_id;
        $this->company_name = $company_name;
        $this->charge_person_name = $charge_person_name;
        $this->system = ($system ?: System::row());
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build() {
        //各リンクの取得
        $user_regist= Screen::rowByScreenId('new_agent_user');          //会員登録画面
        $service_terms = Screen::rowByScreenId('service_terms');        //利用規約

        //認証メールの送信
        return $this->text('emails.agent_register_plain')
            ->subject("会員登録完了のお知らせ〔{$this->system->name}〕")
            ->from($this->system->from_email, $this->system->from_email_name)
            ->bcc([ $this->system->from_email ])
            ->with([
                'system' => $this->system,
                'user_regist_url' => @$user_regist->url . '?key=' . $this->agent_inquiry_id,
                'service_terms_url' => @$service_terms->url,
                'company_name' => $this->company_name,
                'charge_person_name' => $this->charge_person_name,
            ]);
        ;
    }
}
