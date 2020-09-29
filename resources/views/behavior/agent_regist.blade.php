<?php
use App\Helpers\SceneHelper;

use App\Models\DivisionValue;
use App\Models\AttrDef;

//代理店会員情報の属性定義を取得する
$attr_defs = AttrDef::rowsetByAttrDefGroupId('agent');
?>
HelperJS.screendef(function AgentRegist() {
	HelperJS.Screen.call(this);

	var _base = this.base();
	var _this = this;

	var _itemIdControlMap = {};

	_this.btnConfirm_click = function btnConfirm_click(e, params, ctrls) {
		var data = {
		};
<?php   foreach ($attr_defs as $attr_def) {
            $id = 'attr' . str_replace('_', '', ucwords($attr_def->id, '_'));
            switch ($attr_def->value_type) {
                case 1:
                case 11:
                case 2:
                case 3:
                case 4:
                case 5: ?>
                    data["{!! $attr_def->id !!}"] = ctrls.{!! $id !!}.value();
<?php               break;
                case 6:
                    $list = DivisionValue::rowsetByDivisionId($attr_def->selector_division_id);
                    switch ($attr_def->selector_pattern) {
                    case 1:
                    case 4:
                    case 5: ?>
                        data["{!! $attr_def->id !!}"] = ctrls.{!! $id !!}.value();
<?php                   break;
                    case 2: ?>
                        var radioButtons = [];
<?php                   foreach ($list as $item) { ?>
                            radioButtons.push(ctrls.{!! $id !!}{!! $item->value !!});
<?php                   } ?>
                        data["{!! $attr_def->id !!}"] = HelperJS.RadioButton.checkedValue(radioButtons);
<?php
                        break;
                    case 3: ?>
                        var checkBoxs = [];
<?php                   foreach ($list as $item) { ?>
                            checkBoxs.push(ctrls.{!! $id !!}{!! $item->value !!});
<?php                   } ?>
                        data["{!! $attr_def->id !!}"] = HelperJS.CheckBox.checkedValue(checkBoxs);
<?php                   break;
                    }
                    break;
                case 9: ?>
                    data["{!! $attr_def->id !!}"] = ctrls.{!! $id !!}.checked();
<?php               break;
            }
        } ?>

		HelperJS.event("agent_regist", "confirm", data, JOH.events.success(_itemIdControlMap));
	};

	_this.initPanel = function initPanel() {
		//
		_this.controls.btnConfirm.click(_this.handles());

		//入力項目とコントロールのマッピング
		_itemIdControlMap = JOH.events.buildItemControlMap(_this);
	};
});
