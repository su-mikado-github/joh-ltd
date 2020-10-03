HelperJS.namespace("JOH", function(ns) {
	ns.logout = function logout(url, tag) {
		//
		HelperJS.api("/event/system/logout", {}, function(result) {
			if (result.status == "OK") {
				location.assign(url);
			}
			else if (typeof(result.messages) === "string") {
				alert(result.messages);
			}
			else if (result.messages instanceof Array) {
				alert(result.messages.join("\n"));
			}
		});
	};
});

HelperJS.namespace("JOH.events", function(ns) {
	ns.textOnkeydown = function(e) {
		console.log(e.key);
		if (e.key.length === 1) {
			e.returnValue = (new RegExp(e.target.pattern)).test(e.target.value + e.key);
		}
		else if (e.key == "SPACE") {
			e.returnValue = (new RegExp(e.target.pattern)).test(e.target.value + " ");
		}
	};

	ns.buildItemControlMap = function buildItemControlMap(owner) {
		var result = {};

		var items = owner.finds("[data-item_id]");
		for (var i=0; i < items.length; i++) {
			var item = items[i];
			result[item.data("item_id")] = item;
		}

		return result;
	};

	ns.clearErrors = function clearErrors(ctrls) {
		for (var i in ctrls) {
			ctrls[i].styleClass({ remove:"JOH-Input-Error" });
		}
	};

	ns.success = function success(ctrls, handler) {
		if (typeof(ctrls) === "function" && !ctrls) {
			handler = ctrls;
			ctrls = {};
		}
		else if (!ctrls) {
			ctrls = {};
		}

		JOH.events.clearErrors(ctrls);

		return function(result) {
			if (result.status === "OK") {
				if (typeof(handler) === "function") {
					if (!handler(result)) {
						return;
					}
				}
				if (result.url) {
					location.assign(result.url);
				}
			}
			else if (result.status === "BACKWORD") {
				history.back();
			}
			else if (result.status === "INVALID") {
				for (var i in result.errors) {
					var error = result.errors[i];
					if (error instanceof Array && 0 < error.length) {
						if (ctrls[i] instanceof HelperJS.Control) {
							ctrls[i].styleClass({ add:"JOH-Input-Error" });
						}
					}
				}
			}
			else if (result.status === "ERROR") {
				if (typeof(result.messages) === "string") {
					alert(result.messages);
				}
				else if (result.messages instanceof Array) {
					alert(result.messages.join("\n"));
				}
			}
		};
	};
});

