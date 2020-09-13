<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class UserRole extends Model {
    public static function getByUserId($user_id) {
        return self::where('user_id', '=', $user_id)->get('role_id');
    }

    //
    public $incrementing = false;
}
