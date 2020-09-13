<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class AttrDef extends Model {
    public static function rowsetByAttrDefGroupId($attr_def_group_id) {
        $sql = <<<SQL_END
select
  t.*
from
  attr_defs t
where
  t.attr_def_group_id = ?
  and t.delete_flag = 0
order by
  t.display_order
SQL_END;
        return DB::select($sql, [ $attr_def_group_id ]);
    }


    //
    public $incrementing = false;
}
