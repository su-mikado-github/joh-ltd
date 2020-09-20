<?php
use App\Helpers\SceneHelper;

use App\Models\DivisionValue;
use App\Models\AttrDef;

//会員情報の属性定義を取得する
$attr_defs = AttrDef::rowsetByAttrDefGroupId('user');

?>
HelperJS.screendef(function NewUserPreview() {
    HelperJS.Screen.call(this);

    var _base = this.base();
    var _this = this;

    _this.btnAccept_click = function btnAccept_click(e, params, ctrls) {
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

        HelperJS.api("{!! SceneHelper::url('/event/system/new_user') !!}", data, function(result) {
            if (result.status === "OK") {
                location.assign(result.url);
            }
            else if (result.status === "INVALID") {
                alert(JSON.stringify(result));
            }
            else if (result.status === "ERROR") {
                alert(result.messages);
            }
        });
    };

    _this.btnBackword_click = function btnBackword_click(e, params, ctrls) {
    	history.back();
    };

    _this.initPanel = function initPanel() {
        //
        _this.controls.btnAccept.click(_this.handles());
        _this.controls.btnBackword.click(_this.handles());
    };
});
