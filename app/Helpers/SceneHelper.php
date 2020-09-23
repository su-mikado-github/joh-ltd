<?php
namespace App\Helpers;

use Illuminate\Http\Request;

use Log;

class SceneHelper {
    const OK = 'OK';
    const BACKWORD = 'BACKWORD';
    const INVALID = 'INVALID';
    const ERROR = 'ERROR';

    public static function set($url, $params) {
        if (empty($params)) {
            return $url;
        }
        else {
            $key = uniqid();
            $result = $url . (strpos($url, '?') === false ? '?' : '&') . http_build_query(['key'=>$key]);
            Log::debug(__FILE__ . '(' . __LINE__ . ') => ' . $result . ' ' . var_export($params, true));
            session()->put($key, $params);
            return $result;
        }
    }

    public static function get(Request $request, $defaults=null) {
        $key = $request->get('key');
        $params = ($key && session()->exists($key) ? session()->get($key) : $defaults);
        Log::debug(__FILE__ . '(' . __LINE__ . ') => ' . $key . ' ' . var_export($params, true));
        return $params ?: [];
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

    public static function input(Request $request, array $default=null) {
        $input = $request->get('input');
        return ($input ? json_decode($input, true) : $default)?:[];
    }

    public static function ok($messages=null, array $params=null) {
        return [ 'status'=>self::OK, 'messages'=>$messages, 'params'=>$params?:[] ];
    }

    public static function forward($url, array $params=null) {
        return [ 'status'=>self::OK, 'url'=>self::set($url, $params?:[]) ];
    }

    public static function backword() {
        return [ 'status'=>self::BACKWORD ];
    }

    public static function invalid($messages, array $errors) {
        return [ 'status'=>self::INVALID, 'messages'=>$messages, 'errors'=>$errors ];
    }

    public static function error($messages, array $params=null) {
        return [ 'status'=>self::ERROR, 'messages'=>$messages, 'params'=>$params?:[] ];
    }
}