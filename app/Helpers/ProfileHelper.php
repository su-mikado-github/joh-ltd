<?php
namespace App\Helpers;

use Log;
use Session;

class ProfileHelper {
    public static function is_guest($profile=null) {
        if (!$profile) {
            $profile = session('profile', []);
        }

        if (!$profile) {
            return true;
        }
        else if (empty($profile['roles'])) {
            return true;
        }
        else if (count($profile['roles'])==1 && in_array('Guest', $profile['roles'])) {
            return true;
        }
        return false;
    }

    public static function is_role($role, $profile=null) {
        if (!$profile) {
            $profile = session('profile', []);
        }

        return (!empty($profile) && is_array($profile['roles']) && in_array($role, $profile['roles']));
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

