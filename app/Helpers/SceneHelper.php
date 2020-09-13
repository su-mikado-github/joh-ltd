<?php
namespace App\Helpers;

use Illuminate\Http\Request;

class SceneHelper {
    public static function set($url, $params) {
        $key = uniqid();
        $result = $url . (strpos($url, '?') === false ? '?' : '&') . http_build_query(['key'=>$key]);
        session()->put($key, $params);
        return $result;
    }

    public static function get(Request $request, $defaults=null) {
        $key = $request->get('key');
        return ($key && session()->exists($key) ? session()->get($key) : $defaults);
    }

    public static function clear(Request $request) {
        $key = $request->get('key');
        if ($key && session()->exists($key)) {
            session()->forget($key);
        }
    }
}