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
        HelperJS.api("{!! SceneHelper::url('/event/system/new_user_apply') !!}", {}, function(result) {
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
