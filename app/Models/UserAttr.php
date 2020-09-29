<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class UserAttr extends Model {

    public static function rowsetByUserId($user_id) {
        $sql = <<<SQL_END
select
  t.*
from
  user_attrs t
  inner join attr_defs ts1 on (
    ts1.id = t.attr_def_id
  )
where
  t.user_id = ?
order by
  ts1.display_order
SQL_END;
        return DB::select($sql, [ $user_id ]);
    }

    protected $table = 'user_attrs';

    //
    public $incrementing = false;
}
