<?php
namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use App\Models\AttrDef;

use Illuminate\Http\Request;

use Log;

class AgentRegistController extends Controller {
    //
    public function index(Request $request) {
        //
        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('agent');

        Log::debug($attr_defs);

        return view('scene.agent_regist_index', [
            //
            'attr_defs' => $attr_defs,
        ]);
    }
}
