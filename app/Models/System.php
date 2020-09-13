<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class System extends Model {
    public static function row() {
        $sql = <<<SQL_END
select
  t.*
  , ts1.name as source_company_name
  , ts1.logo_path as source_company_logo_path
  , ts1.tel_no as source_company_tel_no
  , ts1.zip_no as source_company_zip_no
  , ts1.address as source_company_address
  , ts1.building as source_company_building
  , ts1.business_hours as source_company_business_hours
  , ts2.name as proprietary_company_name
  , ts2.logo_path as proprietary_company_logo_path
  , ts2.tel_no as proprietary_company_tel_no
  , ts2.zip_no as proprietary_company_zip_no
  , ts2.address as proprietary_company_address
  , ts2.building as proprietary_company_building
  , ts2.business_hours as proprietary_company_business_hours
from
  systems t
  left outer join campanys ts1 on (
    ts1.id = t.source_company
  )
  left outer join campanys ts2 on (
    ts1.id = t.proprietary_company
  )
where
  t.id = ?
SQL_END;
        return DB::selectOne($sql, [ '*' ]);
    }

    //
    public $incrementing = false;
}
