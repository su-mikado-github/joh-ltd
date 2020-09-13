<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class DivisionValue extends Model {
    public static function rowsetByDivisionId($division_id) {
        $sql = <<<SQL_END
select
  t.*
from
  division_values t
where
  t.division_id = ?
  and t.delete_flag = 0
order by
  t.display_order
SQL_END;
        return DB::select($sql, [ $division_id ]);
    }


    //
    public $incrementing = false;
}
