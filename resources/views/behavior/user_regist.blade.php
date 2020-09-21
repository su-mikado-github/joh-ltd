HelperJS.screendef(function UserRegist() {
	HelperJS.Screen.call(this);

	var _base = this.base();
	var _this = this;

	_this.btnSendMail_click = function btnSendMail_click(e, params, ctrls) {
		//
		var data = {
			mailAddress: ctrls.txtMailAddress.value()
		};
		HelperJS.api("/event/system/user_regist", data, function(result) {
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

	_this.initPanel = function initPanel() {
		//
		_this.controls.btnSendMail.click(_this.handles());
	};
});
