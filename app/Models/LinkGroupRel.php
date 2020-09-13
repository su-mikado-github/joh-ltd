<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class LinkGroupRel extends Model {
    //
    public static function rowsetByLinkGroupId($link_group_id) {
        $sql =<<< SQL_END
select
  t.*
  , ts1.name as link_group_name
  , ts1.description as link_group_description
  , ts2.name as link_name
  , ts2.description as link_description
from
  link_group_rels t
  inner join link_groups ts1 on (
    ts1.id = t.link_group_id
    and ts1.delete_flag = 0
  )
  inner join links ts2 on (
    ts2.id = t.link_id
    and ts2.delete_flag = 0
  )
where
  t.link_group_id = ?
  and t.delete_flag = 0
order by
  t.display_order
SQL_END;
        return DB::select($sql, [ $link_group_id ]);
    }


    //
    public $incrementing = false;
}
