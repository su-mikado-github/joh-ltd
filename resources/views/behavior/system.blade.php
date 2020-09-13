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