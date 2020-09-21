<?php
namespace App\Helpers;

use Illuminate\Http\Request;

use Log;

class SceneHelper {
    public static function set($url, $params) {
        $key = uniqid();
        $result = $url . (strpos($url, '?') === false ? '?' : '&') . http_build_query(['key'=>$key]);
        Log::debug(__FILE__ . '(' . __LINE__ . ') => ' . $result . ' ' . var_export($params, true));
        session()->put($key, $params);
        return $result;
    }

    public static function get(Request $request, $defaults=null) {
        $key = $request->get('key');
        $params = ($key && session()->exists($key) ? session()->get($key) : $defaults);
        Log::debug(__FILE__ . '(' . __LINE__ . ') => ' . $key . ' ' . var_export($params, true));
        return $params;
    }

    public static function clear(Request $request) {
        $key = $request->get('key');
        if ($key && session()->exists($key)) {
            session()->forget($key);
        }
    }

    public static function url($url) {
        if (request()->has('key')) {
            return $url . (strpos($url, '?')===false ? '?' : '&') . 'key=' . request()->get('key');
        }
        else {
            return $url;
        }
    }
}