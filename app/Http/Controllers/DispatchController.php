<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Helpers\SceneHelper;

class DispatchController extends Controller {
    public function method_dispatch(Request $request, $method) {
        if (method_exists($this, $method)) {
            $input = SceneHelper::input($request);
            $params = SceneHelper::get($request);
            return call_user_func([$this, $method], $request, $input, $params);
        }
        else {
            return response('', 404);
        }
    }
}
