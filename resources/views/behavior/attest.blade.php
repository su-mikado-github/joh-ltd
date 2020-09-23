HelperJS.screendef(function Attest() {
	HelperJS.Screen.call(this);

	var _base = this.base();
	var _this = this;

	var _itemIdControlMap = {};

	_this.btnGoLogin_click = function btnGoLogin_click(e, params, ctrls) {
		var data = {
			loginId: ctrls.txtLoginId.value(),
			loginPw: ctrls.txtLoginPassword.value(),
			rememberMe: ctrls.chkRememberMe.checked(),
		};
		HelperJS.api('/event/system/login', data, JOH.events.success(_itemIdControlMap));
	};

	_this.initPanel = function initPanel(controls) {
		controls.btnGoLogin.click(_this.handles());

		//入力項目とコントロールのマッピング
		_itemIdControlMap = JOH.events.buildItemControlMap(_this);
	};
});
