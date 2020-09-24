<?php
use App\Helpers\SceneHelper;

use App\Models\DivisionValue;
use App\Models\AttrDef;

?>
HelperJS.screendef(function AgentRegistPreview() {
    HelperJS.Screen.call(this);

    var _base = this.base();
    var _this = this;

    _this.btnAccept_click = function btnAccept_click(e, params, ctrls) {
        //
        HelperJS.api("{!! SceneHelper::url('/event/agent_regist_preview/accept') !!}", {}, JOH.events.success());
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
