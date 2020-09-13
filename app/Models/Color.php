<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class Color extends Model {

    public static function rowsetByThemeId($theme_id=null) {
        $sql = <<<SQL_END
select
  IFNULL(ts1.category, t.category) as category
  , IFNULL(ts1.id, t.id) as id
  , IF(ts1.id IS NULL, t.fore_color, ts1.fore_color) as fore_color
  , IF(ts1.id IS NULL, t.back_color, ts1.back_color) as back_color
  , IF(ts1.id IS NULL, t.border_color, ts1.border_color) as border_color
  , IFNULL(ts1.descrption, t.descrption) as descrption
from
  colors t
  left outer join colors ts1 on (
    ts1.theme_id = ?
    and ts1.category = t.category
    and ts1.id = t.id
  )
where
  t.theme_id = '*'
SQL_END;
        return DB::select($sql, [ $theme_id ?: '*' ]);
    }

    public static function rowByThemeId($category, $id, $theme_id=null) {
        $sql = <<<SQL_END
select
  IFNULL(ts1.category, t.category) as category
  , IFNULL(ts1.id, t.id) as id
  , IF(ts1.id IS NULL, t.fore_color, ts1.fore_color) as fore_color
  , IF(ts1.id IS NULL, t.back_color, ts1.back_color) as back_color
  , IF(ts1.id IS NULL, t.border_color, ts1.border_color) as border_color
  , IFNULL(ts1.descrption, t.descrption) as descrption
from
  colors t
  left outer join colors ts1 on (
    ts1.theme_id = ?
    and ts1.category = t.category
    and ts1.id = t.id
  )
where
  t.theme_id = '*'
  and t.category = ?
  and t.id = ?
SQL_END;
        return DB::select($sql, [ $theme_id ?: '*', $category, $id ]);
    }

    //
    public $incrementing = false;
}
