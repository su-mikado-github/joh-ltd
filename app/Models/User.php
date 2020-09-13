<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

use DB;

class User extends Model {
    /**
     * ログインIDとパスワードに一致する利用者情報を取得する
     * @param string $login_id
     * @param string $password
     * @return object
     */
    public static function rowByLoginIdPassword($login_id, $password) {
        $sql = <<<SQL_END
select
  t.*
  , IF(ts1.user_id is NULL, 0, 1) as valid_user
from
  users t
  left outer join user_passwords ts1 on (
    ts1.user_id = t.id
    and ts1.password = MD5(?)
    and ts1.delete_flag = 0
  )
where
  t.login_id = ?
  and t.delete_flag = 0
SQL_END;
        return DB::selectOne($sql, [ $password, $login_id ]);
    }

    public static function inclementToRetryCount($user_id, $modify_id='*') {
        $sql = <<<SQL_END
update
  users
set
  retry_count = retry_count + 1
  , modify_tm = UNIX_TIMESTAMP()
  , modify_id = ?
where
  id = ?
SQL_END;
        return DB::update($sql, [ $modify_id, $user_id ]);
    }

    public static function login($user_id, $modify_id='*') {
        $sql = <<<SQL_END
update
  users
set
  retry_count = 0
  , last_login_dtm = CURRENT_TIMESTAMP()
  , modify_tm = UNIX_TIMESTAMP()
  , modify_id = ?
where
  id = ?
SQL_END;
        return DB::update($sql, [ $modify_id, $user_id ]);
    }

    public static function updateLastLoginDtm($user_id) {
        $sql = <<<SQL_END
update
  users
set
  last_login_dtm = CURRENT_TIMESTAMP()
  , modify_tm = UNIX_TIMESTAMP()
  , modify_id = ?
where
  id = ?
SQL_END;
        return DB::update($sql, [ $user_id, $user_id ]);
    }

    public static function registNew($email) {
        return DB::transaction(function($c) use($email) {
            $user_id = uniqid();
            $temporary_regist_id = uniqid();

            $sql = <<<SQL_END
insert into users (
  id
  , nickname
  , email
  , login_id
  , admin_flag
  , retry_count
  , last_login_dtm
  , regist_dtm
  , create_tm
  , create_id
  , modify_tm
  , modify_id
  , program
  , delete_flag
)
values (
  ?
  , NULL
  , ?
  , ?
  , 0
  , 0
  , NULL
  , NULL
  , UNIX_TIMESTAMP()
  , ?
  , UNIX_TIMESTAMP()
  , ?
  , ?
  , 0
)
SQL_END;
            $c->insert($sql, [ $user_id, $email, $email, $user_id, $user_id, __METHOD__ ]);

            //
            $sql = <<<SQL_END
insert into temprary_regists (
  id
  , user_id
  , apply_dtm
  , create_tm
  , create_id
  , modify_tm
  , modify_id
  , program
  , delete_flag
)
values (
  ?
  , ?
  , CURRENT_TIMESTAMP()
  , UNIX_TIMESTAMP()
  , ?
  , UNIX_TIMESTAMP()
  , ?
  , ?
  , 0
)
SQL_END;
            $c->insert($sql, [ $temporary_regist_id, $user_id, $user_id, $user_id, __METHOD__ ]);

            return $temporary_regist_id;
        });
    }

    public static function rowByTempraryRegisterId($temporary_register_id) {
        $sql = <<<SQL_END
select
  t.*
  , ts1.id  as temporary_register_id
  , ts1.apply_dtm
from
  users t
  inner join temprary_regists ts1 on (
    ts1.id = ?
    and ts1.user_id = t.id
    and ts1.delete_flag = 0
  )
where
  t.delete_flag = 0
SQL_END;
        return DB::selectOne($sql, [ $temporary_register_id ]);
    }

    //
    public $incrementing = false;
}
