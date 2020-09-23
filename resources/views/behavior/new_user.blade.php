<?php
use App\Helpers\SceneHelper;

use App\Models\DivisionValue;
use App\Models\AttrDef;

//会員情報の属性定義を取得する
$attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

?>
HelperJS.screendef(function NewUser() {
    HelperJS.Screen.call(this);

    var _base = this.base();
    var _this = this;

	var _itemIdControlMap = {};

    _this.btnPreview_click = function btnPreview_click(e, params, ctrls) {
        //
        var data = {
            temporary_regist_id: ctrls.varTemporaryRegistId.value(),
			email: ctrls.txtMailAddress.value(),
            password: ctrls.txtLoginPassword.value(),
            password_confirmation: ctrls.txtLoginPasswordConfirmation.value(),
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
            }
        } ?>

		HelperJS.event("system", "new_user_check", data, JOH.events.success(_itemIdControlMap));
//        HelperJS.api("{!! SceneHelper::url('/event/system/new_user_check') !!}", data, function(result) {
//            if (result.status === "OK") {
//                location.assign(result.url);
//            }
//            else if (result.status === "INVALID") {
//                alert(JSON.stringify(result));
//            }
//            else if (result.status === "ERROR") {
//                alert(result.messages);
//            }
//        });
    };

    _this.initPanel = function initPanel() {
        //
        _this.controls.btnPreview.click(_this.handles());

		_itemIdControlMap = JOH.events.buildItemControlMap(_this);
//		var items = _this.finds("[data-item_id]");
//		for (var i=0; i<items.length; i++) {
//			var item = items[i];
//			_itemIdControlMap[item.data("item_id")] = item;
//		}
    };
});
