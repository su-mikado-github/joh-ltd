<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class LinkItem extends Model {
    public static function rowsetByLinkId($link_id, $certified=false) {
        $sql = <<<SQL_END
select
  t.*
  , ts1.name as link_name
  , ts2.url
from
  link_items t
  inner join links ts1 on (
    ts1.id = t.link_id
    and ts1.delete_flag = 0
  )
  left outer join screens ts2 on (
    ts2.id = t.link_item_value
    and ts2.delete_flag = 0
  )
where
  t.link_id = ?
  and t.delete_flag = 0
  and (
    (? = 0 and t.guest_enable_flag = 1)
    or (? = 1 and t.certified_enable_flag = 1)
  )
order by
  t.display_order
SQL_END;
        return DB::select($sql, [
            $link_id,
            (!$certified ? 0 : 1),
            (!$certified ? 0 : 1)
        ]);
    }

    public static function rowByLinkIdLinkItemId($link_id, $link_item_id, $certified=false) {
        $sql = <<<SQL_END
select
  t.*
  , ts1.name as link_name
  , ts2.url
from
  link_items t
  inner join links ts1 on (
    ts1.id = t.link_id
    and ts1.delete_flag = 0
  )
  left outer join screens ts2 on (
    ts2.id = t.link_item_value
    and ts2.delete_flag = 0
  )
where
  t.link_id = ?
  and t.link_item_id = ?
  and t.delete_flag = 0
  and (
    (? = 0 and t.guest_enable_flag = 1)
    or (? = 1 and t.certified_enable_flag = 1)
  )
order by
  t.display_order
SQL_END;
        $result = DB::select($sql, [
            $link_id,
            $link_item_id,
            (!$certified ? 0 : 1),
            (!$certified ? 0 : 1)
        ]);
        return (!$result ? null : $result[0]);
    }

    //
    public $incrementing = false;
}
