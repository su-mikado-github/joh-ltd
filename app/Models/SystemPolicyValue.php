<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class SystemPolicyValue extends Model {
    public static function rowsetBySystemPolicyId($system_policy_id) {
        $sql = <<<SQL_END
select
  t.*
from
  system_policy_values t
where
  t.system_policy_id = ?
order by
  t.display_order
SQL_END;
        return DB::select($sql, [ $system_policy_id ]);
    }

    public static function rowBySystemPolicyIdSystemPolicyValueId($system_policy_id, $system_policy_value_id, $default_value=null) {
        $sql = <<<SQL_END
select
  t.*
from
  system_policy_values t
where
  t.system_policy_id = ?
  and t.id = ?
order by
  t.display_order
SQL_END;
        return DB::selectOne($sql, [ $system_policy_id, $system_policy_value_id ]);
    }

    //
    public $incrementing = false;
}
