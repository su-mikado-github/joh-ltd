<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class Screen extends Model {
    public static function rowByScreenId($screen_id) {
        $sql = <<<SQL_END
select
  t.*
from
  screens t
where
  t.id = ?
  and t.delete_flag = 0
SQL_END;
        return DB::selectOne($sql, [ $screen_id ]);
    }

    //
    public $incrementing = false;
}
