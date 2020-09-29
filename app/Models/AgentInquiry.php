<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class AgentInquiry extends Model {
    //
    public static function createWithAgentAttrs(array $agent_attrs) {
        $id = uniqid();

        DB::transaction(function($c) use($id, $agent_attrs) {
            //代理店問合せトランの作成
            $sql = <<<SQL_END
insert into agent_inquirys (
    id
    , inquiry_dtm
    , email_attr_id
    , progress
    , reply_dtm
    , reply_user_id
    , reply_content
    , user_id
    , create_tm
    , create_id
    , modify_tm
    , modify_id
    , program
    , delete_flag
)
values (
    ?
    , CURRENT_TIMESTAMP()
    , 'contact_email'
    , 0
    , NULL
    , NULL
    , NULL
    , NULL
    , UNIX_TIMESTAMP()
    , '*'
    , UNIX_TIMESTAMP()
    , '*'
    , ?
    , 0
)
SQL_END;
            $c->insert($sql, [ $id, __METHOD__ ]);

            //代理店問合せ属性トランの作成
            $sql = <<<SQL_END
insert into agent_inquiry_attrs (
    agent_inquiry_id
    , attr_def_id
    , attr_value
    , publish
    , create_tm
    , create_id
    , modify_tm
    , modify_id
    , program
    , delete_flag
)
values (
    ?
    , ?
    , ?
    , 1
    , UNIX_TIMESTAMP()
    , '*'
    , UNIX_TIMESTAMP()
    , '*'
    , ?
    , 0
)
SQL_END;
            foreach ($agent_attrs as $agent_attr) {
                $c->insert($sql, [
                    $id
                    , $agent_attr['id']
                    , (is_array($agent_attr['value']) ? implode(',', $agent_attr['value']) : $agent_attr['value'])
                    , __METHOD__
                ]);
            }
        });

        return $id;
    }

    public static function rowByAgentInquiryId($agent_inquiry_id) {
        return DB::table('agent_inquirys')->where('id', $agent_inquiry_id)->first();
    }

    //
    public $incrementing = false;
}
