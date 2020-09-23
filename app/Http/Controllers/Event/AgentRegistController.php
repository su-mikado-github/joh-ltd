<?php

namespace App\Http\Controllers\Event;

use App\Http\Controllers\DispatchController;
use Illuminate\Http\Request;
use App\Helpers\SceneHelper;
use App\Models\AttrDef;

use Validator;

class AgentRegistController extends DispatchController {
    const messages = [
        'required' => '入力が必要です。',
    ];

    //
    public function confirm(Request $request, array $input, array $params) {
//         $input = SceneHelper::input($request);

        //会員情報の属性定義を取得する
        $attr_defs = AttrDef::rowsetByAttrDefGroupId('agent');

        $rules = [];

        //ユーザーカスタム属性のチェック
        foreach ($attr_defs as $attr_def) {
            $rule = [];
            switch ($attr_def->value_type) {
                case 1:     //単行文字列
                case 11:    //複行文字列
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    if (!empty($attr_def->min_length)) {
                        $rule[] = 'min:' . $attr_def->min_length;
                    }
                    if (!empty($attr_def->max_length)) {
                        $rule[] = 'max:' . $attr_def->max_length;
                    }
                    if (!empty($attr_def->regex)) {
                        $rule[] = 'regex:/' . $attr_def->regex . '/';
                    }
                    if (!empty($attr_def->regex_unmatch)) {
                        $rule[] = 'not_regex:/' . $attr_def->regex_unmatch . '/';
                    }
                    break;
                case 2:     //整数
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'integer';
                    if (!empty($attr_def->min_bigint_value)) {
                        $rule[] = 'min:' . $attr_def->min_bigint_value;
                    }
                    if (!empty($attr_def->max_bigint_value)) {
                        $rule[] = 'max:' . $attr_def->max_bigint_value;
                    }
                    break;
                case 3:     //浮動小数
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'numeric';
                    if (!empty($attr_def->min_double_value)) {
                        $rule[] = 'min:' . $attr_def->min_double_value;
                    }
                    if (!empty($attr_def->max_double_value)) {
                        $rule[] = 'max:' . $attr_def->max_double_value;
                    }
                    break;
                case 4:     //日付
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'date';
                    if (!empty($attr_def->start_date)) {
                        $rule[] = 'after_or_equal:' . $attr_def->start_date;
                    }
                    if (!empty($attr_def->end_date)) {
                        $rule[] = 'before_or_equal:' . $attr_def->end_date;
                    }
                    break;
                case 5:     //時刻
                    if ($attr_def->require_flag) {
                        $rule[] = 'required';
                    }
                    $rule[] = 'date_format:H:i';
                    if (!empty($attr_def->start_time)) {
                        $rule[] = 'after_or_equal:' . $attr_def->start_time;
                    }
                    if (!empty($attr_def->end_time)) {
                        $rule[] = 'before_or_equal:' . $attr_def->end_time;
                    }
                    break;
                case 6:     //区分選択肢
                    switch ($attr_def->selector_pattern) {
                        case 1:
                        case 2:
                        case 4:
                            $rule[] = function($attribute, $value, $fail) use($division_value_map, $attr_def) {
                                if ($attr_def->require_flag) {
                                    if (!$value) {
                                        $fail('いずれかを選択してください。');
                                        return;
                                    }
                                }
                                if (!isset($division_value_map[$attr_def->selector_division_id][$value])) {
                                    $fail('いずれかを選択してください。');
                                }
                            };
                            break;
                        case 3:
                        case 5:
                            $rule[] = function($attribute, $value, $fail) use($division_value_map, $attr_def) {
                                if ($attr_def->require_flag) {
                                    if (!$value) {
                                        $fail('いずれかを選択してください。');
                                        return;
                                    }
                                }
                                foreach ($value as $division_id) {
                                    if (!isset($division_value_map[$attr_def->selector_division_id][$division_id])) {
                                        $fail('いずれかを選択してください。');
                                    }
                                }
                            };
                            break;
                    }
                    break;
                case 7:
                    break;
                case 8:
                    break;
                case 99:
                    break;
            }

            $rules[$attr_def->id] = $rule;
        }

        $validator = Validator::make($input, $rules, self::messages);
        if ($validator->fails()) {
            return [ 'status'=>'INVALID', 'messages'=>'入力にエラーがあります。', 'errors'=>$validator->errors() ];
        }

        $regist_data = [];
        foreach ($attr_defs as $attr_def) {
            $regist_data[] = [  'id'=>$attr_def->id, 'value'=>$input[$attr_def->id] ];
        }

        return SceneHelper::ok(null, [
            'regist_data' => $regist_data,
        ]);
    }
}
