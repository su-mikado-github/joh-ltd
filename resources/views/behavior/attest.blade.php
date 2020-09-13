HelperJS.screendef(function Attest() {
	HelperJS.Screen.call(this);

	var _base = this.base();
	var _this = this;

//	var _txtLoginId = null;
//	var _txtLoginPassword = null;
//	var _chkRememberMe = null;
//	var _btnGoLogin = null;

	_this.btnGoLogin_click = function btnGoLogin_click(e, params, ctrls) {
		var data = {
			loginId: ctrls.txtLoginId.value(),
			loginPw: ctrls.txtLoginPassword.value(),
			rememberMe: ctrls.chkRememberMe.checked(),
		};
		HelperJS.api('/event/system/login', data, function(result) {
			if (result.status === "OK") {
				location.assign(result.url);
			}
			else if (result.status === "INVALID") {
				alert(result.messages);
			}
			else if (result.status === "ERROR") {
				alert(result.messages);
			}
		});
	};

	_this.initialize = function initialize() {
		_this.controls.btnGoLogin.click(_this.handles());
	};
});
