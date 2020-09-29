<?php

namespace App\Http\Controllers\Event;

use App\Http\Controllers\DispatchController;
use Illuminate\Http\Request;
use App\Helpers\SceneHelper;
use App\Models\AgentInquiry;
use App\Mail\AgentInquiryed;

use Validator;
use Mail;
use Log;

class AgentRegistPreviewController extends DispatchController {
    public function accept(Request $request, array $input, array $params) {
        $regist_data = $params['regist_data'];
        $company_name = $params['company_name'];
        $charge_person_name = $params['charge_person_name'];
        $contact_email = $params['contact_email'];

        //代理店問合せの保存
        try {
            $agent_inquiry_id = AgentInquiry::createWithAgentAttrs($regist_data);
        }
        catch (\Exception $ex) {
            Log::error($ex);
            Log::error($regist_data);
            return SceneHelper::error('代理店問合せの保存に失敗しました。');
        }

        //登録完了メールの送信
        Mail::to($contact_email)->send(new AgentInquiryed($agent_inquiry_id, $company_name, $charge_person_name));

        return SceneHelper::forward('/scene/top');
    }
}
