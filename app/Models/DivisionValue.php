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

    public static function mapByDivisionIdId(array $excludes=['*'], $delete_flag=null) {
        $model = ($delete_flag===null ? self::all() : self::where('division_values.delete_flag', 0));
        if ($excludes) {
            $model = $model->whereNotIn('division_values.id', $excludes);
        }
        $rowset = $model->join('divisions', 'divisions.id', '=', 'division_values.division_id')
                        ->select('division_values.*', 'divisions.name as division_name', 'divisions.public_flag as division_public_flag', 'divisions.display_order as division_display_order')
                        ->get()
                        ->toArray();

        return array_reduce($rowset, function($result, $item) {
            $division_id = $item['division_id'];
            $id = $item['id'];

            if (!isset($result[$division_id])) {
                $result[$division_id] = [ $id => (object)$item ];
            }
            else if (!isset($result[$division_id][$id])) {
                $result[$division_id][$id] = (object)$item;
            }

            return $result;
        }, []);
    }

    protected $table = 'division_values';

    //
    public $incrementing = false;
}
