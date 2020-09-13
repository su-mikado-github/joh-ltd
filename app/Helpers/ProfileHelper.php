<?php
namespace App\Helpers;

use Log;
use Session;

class ProfileHelper {
    public static function is_guest($profile=null) {
        if (!$profile) {
            $profile = session('profile', []);
        }
        return (!$profile ? true : empty($profile['roles']));
    }

    public static function get() {
        $profile = session('profile');
        return ($profile ?: []);
    }

    public static function set($profile) {
        if ($profile === null) {
            session()->forget('profile');
        }
        else {
            session()->put('profile', $profile);
        }
    }

    public static function logout() {
        $profile = session('profile', null);
        if ($profile) {
            $profile['roles'] = null;
            session()->put('profile', $profile);
        }
    }
}

