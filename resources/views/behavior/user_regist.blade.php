HelperJS.screendef(function UserRegist() {
	HelperJS.Screen.call(this);

	var _base = this.base();
	var _this = this;

	var _itemIdControlMap = {};

	_this.btnSendMail_click = function btnSendMail_click(e, params, ctrls) {
		//
		var data = {
			mailAddress: ctrls.txtMailAddress.value()
		};
		HelperJS.api("/event/system/user_regist", data, JOH.events.success(_itemIdControlMap));
	};

	_this.initPanel = function initPanel() {
		//
		_this.controls.btnSendMail.click(_this.handles());

		//入力項目とコントロールのマッピング
		_itemIdControlMap = JOH.events.buildItemControlMap(_this);
	};
});
