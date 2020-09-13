HelperJS.namespace("JOH.components", function(ns) {
	ns.Header = HelperJS.classdef(HelperJS.Panel, function Header(screen, tag) {
		HelperJS.Panel.call(this, this, tag);

		var _base = this.base();
		var _this = this;

		_this.initialize = function initialize() {
			_base.initialize();
			//
		};
	});

	ns.Links = HelperJS.classdef(HelperJS.Panel, function Links(screen, tag) {
		HelperJS.Panel.call(this, this, tag);

		var _base = this.base();
		var _this = this;

		var _linkItems = [];

		function linkItems_click(e) {
			var target = HelperJS.tag(e.target);
			var linkItemValue = target.data("linkItemValue");
			var url = target.data("url");

			if (linkItemValue == 2) {			{{-- 2:クライアント処理を実行 --}}
    			var method = JOH[linkItemValue];
    			if (typeof(method) === "function") {
    				method(url, target);
    			}

    			e.preventDefault();
    			e.stopPropagation();
			}
			else if (linkItemValue == 3) {			{{-- 3:サーバー処理を実行 --}}
    			HelperJS.api(linkItemValue, {}, function(result) {
					if (typeof(result.behavior) === "string") {
						eval(result.behavior);
					}
    			});

    			e.preventDefault();
    			e.stopPropagation();
			}
		}

		_this.initialize = function initialize() {
			_base.initialize();
			//
			_linkItems = _this.finds('dd > *').click(linkItems_click);
		};
	});

});
