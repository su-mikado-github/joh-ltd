<?php

namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\User;
use App\Models\AttrDef;
use App\Models\SystemPolicyValue;

use Log;
use App\Helpers\SceneHelper;

class NewUserController extends Controller {
    //
    public function index(Request $request) {
        $params = SceneHelper::get($request);


        return view('scene.new_user_index', [
            //

        ]);
    }
}
