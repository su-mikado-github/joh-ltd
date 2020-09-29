<?php

namespace App\Http\Controllers\Scene;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\DivisionValue;
use App\Models\User;
use App\Models\AttrDef;
use App\Models\SystemPolicyValue;

use Log;
use App\Helpers\SceneHelper;

class AgentRegistPreviewController extends Controller {
    //
    public function index(Request $request) {
        $params = SceneHelper::get($request);

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('agent');

        //区分値マスタを区分ID・区分値IDをキーとした連想配列として取得
        $division_value_map = DivisionValue::mapByDivisionIdId(['*'], 0);

        //登録する会員情報
        $user_info = [];

        $regist_data_map = array_reduce($params['regist_data'], function($result, $item) { $result[$item['id']] = $item; return $result; }, []);
        foreach ($attr_defs as $attr_def) {
            switch ($attr_def->value_type) {
                case 1:
                case 11:
                case 2:
                case 3:
                case 4:
                case 5:
                    $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$regist_data_map[$attr_def->id]['value'] ];
                    break;
                case 6:
                    switch ($attr_def->selector_pattern) {
                        case 1:
                        case 2:
                        case 4:
                            $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$division_value_map[$attr_def->selector_division_id][$regist_data_map[$attr_def->id]['value']]->name ];
                            break;
                        case 3:
                        case 5:
                            $mapper = function($id) use($division_value_map, $attr_def) {
                                return $division_value_map[$attr_def->selector_division_id][$id]->name;
                            };
                            $value = implode(' ', array_map($mapper, $regist_data_map[$attr_def->id]['value']));
                            $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$value ];
                            break;
                    }
            }
        }

        return view('scene.agent_regist_preview_index', [
            //
            'user_info' => $user_info,
            'company_name' => $params['company_name'],
            'charge_person_name' => $params['charge_person_name'],
            'contact_email' => $params['contact_email'],
        ]);
    }
}
