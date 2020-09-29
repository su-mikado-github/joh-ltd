<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class AgentInquiryAttr extends Model {

    public static function rowsetByAgentInquiryId($agent_inquiry_id) {
        $sql = <<<SQL_END
select
  t.*
  , ts1.attr_def_group_id
  , ts2.attr_def_id_2 as user_attr_def_id
  , ts1.value_type
  , ts1.selector_pattern
from
  agent_inquiry_attrs t
  inner join attr_defs ts1 on (
    ts1.id = t.attr_def_id
  )
  left outer join attr_def_rels ts2 on (
    ts2.attr_def_group_id_1 = 'agent'
    and ts2.attr_def_id_1 = t.attr_def_id
    and ts2.attr_def_group_id_2 = 'user'
  )
where
  t.agent_inquiry_id = ?
SQL_END;

        return DB::select($sql, [ $agent_inquiry_id ]);
    }

    //
    public $incrementing = false;
}
