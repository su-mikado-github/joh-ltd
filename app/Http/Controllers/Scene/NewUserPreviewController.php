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

class NewUserPreviewController extends Controller {
    protected function build_user_attrs(array $regist_data, array $attr_defs, array $user_attrs, array $division_value_map=null) {
        if (!$division_value_map) {
            //区分値マスタを区分ID・区分値IDをキーとした連想配列として取得
            $division_value_map = DivisionValue::mapByDivisionIdId(['*'], 0);
        }

        $regist_data_map = array_reduce($regist_data, function($result, $item) { $result[$item['id']] = $item; return $result; }, []);
        foreach ($attr_defs as $attr_def) {
            switch ($attr_def->value_type) {
                case 1:
                case 11:
                case 2:
                case 3:
                case 4:
                case 5:
                    $user_attrs[] = [ 'label'=>$attr_def->name, 'value'=>$regist_data_map[$attr_def->id]['value'] ];
                    break;
                case 6:
                    switch ($attr_def->selector_pattern) {
                        case 1:
                        case 2:
                        case 4:
                            $user_attrs[] = [ 'label'=>$attr_def->name, 'value'=>$division_value_map[$attr_def->selector_division_id][$regist_data_map[$attr_def->id]['value']]->name ];
                            break;
                        case 3:
                        case 5:
                            $mapper = function($id) use($division_value_map, $attr_def) {
                                return $division_value_map[$attr_def->selector_division_id][$id]->name;
                            };
                            $value = implode(' ', array_map($mapper, $regist_data_map[$attr_def->id]['value']));
                            $user_attrs[] = [ 'label'=>$attr_def->name, 'value'=>$value ];
                            break;
                    }
                    break;
                case 9:
                    $user_attrs[] = [ 'label'=>$attr_def->name, 'value'=>$attr_def->name . ($regist_data_map[$attr_def->id]['value'] ? $attr_def->flag_label : $attr_def->flag_false_label) ];
                    break;
            }
        }

        return $user_attrs;
    }

    //
    public function index(Request $request) {
        $params = SceneHelper::get($request);
        Log::debug($params);

        $user = $params['user'];
        if (!$user) {
            Log::error('仮会員情報が取得できません。');
            return response('', 400);
        }

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

        //表示する会員情報
        $user_info = $this->build_user_attrs($params['regist_data'], $attr_defs, [
            [ 'label'=>'メールアドレス', 'value'=>$params['email'] ],
            [ 'label'=>'パスワード', 'value'=>'********' ],
        ]);

//         //区分値マスタを区分ID・区分値IDをキーとした連想配列として取得
//         $division_value_map = DivisionValue::mapByDivisionIdId(['*'], 0);

//         //登録する会員情報
//         $user_info = [];
//         $user_info[] = [ 'label'=>'メールアドレス', 'value'=>$params['email'] ];
//         $user_info[] = [ 'label'=>'パスワード', 'value'=>'********' ];

//         $regist_data_map = array_reduce($params['regist_data'], function($result, $item) { $result[$item['id']] = $item; return $result; }, []);
//         foreach ($attr_defs as $attr_def) {
//             switch ($attr_def->value_type) {
//                 case 1:
//                 case 11:
//                 case 2:
//                 case 3:
//                 case 4:
//                 case 5:
//                     $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$regist_data_map[$attr_def->id]['value'] ];
//                     break;
//                 case 6:
//                     switch ($attr_def->selector_pattern) {
//                         case 1:
//                         case 2:
//                         case 4:
//                             $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$division_value_map[$attr_def->selector_division_id][$regist_data_map[$attr_def->id]['value']]->name ];
//                             break;
//                         case 3:
//                         case 5:
//                             $mapper = function($id) use($division_value_map, $attr_def) {
//                                 return $division_value_map[$attr_def->selector_division_id][$id]->name;
//                             };
//                             $value = implode(' ', array_map($mapper, $regist_data_map[$attr_def->id]['value']));
//                             $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$value ];
//                             break;
//                     }
//                 case 9:
//                     $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$regist_data_map[$attr_def->id]['name'] . ($regist_data_map[$attr_def->id]['value'] ? $regist_data_map[$attr_def->id]['flag_label'] : $regist_data_map[$attr_def->id]['flag_false_label']) ];
//                     break;
//             }
//         }

        return view('scene.new_user_preview_index', [
            //
            'email' => $params['email'],
            'user_info' => $user_info,
        ]);
    }

    //
    public function agent_user(Request $request) {
        $params = SceneHelper::get($request);

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

        //表示する会員情報
        $user_info = $this->build_user_attrs($params['regist_data'], $attr_defs, [
            [ 'label'=>'メールアドレス', 'value'=>$params['email'] ],
            [ 'label'=>'パスワード', 'value'=>'********' ],
        ]);

//         //区分値マスタを区分ID・区分値IDをキーとした連想配列として取得
//         $division_value_map = DivisionValue::mapByDivisionIdId(['*'], 0);

//         //登録する会員情報
//         $user_info = [];
//         $user_info[] = [ 'label'=>'メールアドレス', 'value'=>$params['email'] ];
//         $user_info[] = [ 'label'=>'パスワード', 'value'=>'********' ];

//         $regist_data_map = array_reduce($params['regist_data'], function($result, $item) { $result[$item['id']] = $item; return $result; }, []);
//         foreach ($attr_defs as $attr_def) {
//             Log::debug($regist_data_map[$attr_def->id]);

//             switch ($attr_def->value_type) {
//                 case 1:
//                 case 11:
//                 case 2:
//                 case 3:
//                 case 4:
//                 case 5:
//                     $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$regist_data_map[$attr_def->id]['value'] ];
//                     break;
//                 case 6:
//                     switch ($attr_def->selector_pattern) {
//                         case 1:
//                         case 2:
//                         case 4:
//                             $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$division_value_map[$attr_def->selector_division_id][$regist_data_map[$attr_def->id]['value']]->name ];
//                             break;
//                         case 3:
//                         case 5:
//                             $mapper = function($id) use($division_value_map, $attr_def) {
//                                 return $division_value_map[$attr_def->selector_division_id][$id]->name;
//                             };
//                             $value = implode(' ', array_map($mapper, $regist_data_map[$attr_def->id]['value']));
//                             $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$value ];
//                             break;
//                     }
//                     break;
//                 case 9:
//                     $user_info[] = [ 'label'=>$attr_def->name, 'value'=>$attr_def->name . ($regist_data_map[$attr_def->id]['value'] ? $attr_def->flag_label : $attr_def->flag_false_label) ];
//                     break;
//             }
//         }

        $user_info[] = [ 'label'=>'代理店', 'value'=>($params['agent_apply'] ? '申請する' : '申請しない') ];

        return view('scene.new_agent_user_preview_index', [
            //
            'email' => $params['email'],
            'agent_apply' => $params['agent_apply'],
            'user_info' => $user_info,
        ]);
    }
}
