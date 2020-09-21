HelperJS.namespace("JOH.components", function(ns) {
	ns.Header = HelperJS.classdef(HelperJS.Panel, function Header(ownerPanel, tag) {
		HelperJS.Panel.call(this, ownerPanel, tag);

		var _base = this.base();
		var _this = this;

		_this.initPanel = function initPanel() {
			//
		};
	});

	ns.Links = HelperJS.classdef(HelperJS.Panel, function Links(ownerPanel, tag) {
		HelperJS.Panel.call(this, ownerPanel, tag);

		var _base = this.base();
		var _this = this;

		var _linkItems = [];

		function linkItems_click(e) {
			var target = _this.tagref(e.target, _linkItems);
			if (target) {
    			var linkItemType = target.data("linkItemType");
    			var linkItemValue = target.data("linkItemValue");
    			var url = target.data("url");

    			if (linkItemType == 2) {			{{-- 2:クライアント処理を実行 --}}
        			var method = JOH[linkItemValue];
        			if (typeof(method) === "function") {
        				method(url, target);
        			}

        			e.preventDefault();
        			e.stopPropagation();
        			e.stopImmediatePropagation();
    			}
    			else if (linkItemType == 3) {			{{-- 3:サーバー処理を実行 --}}
        			HelperJS.api(linkItemValue, {}, function(result) {
    					if (typeof(result.behavior) === "string") {
    						eval(result.behavior);
    					}
        			});

        			e.preventDefault();
        			e.stopPropagation();
        			e.stopImmediatePropagation();
    			}
			}
		}

		_this.initPanel = function initPanel() {
			//
			_linkItems = _this.finds('dd > *').click(linkItems_click);
		};
	});

});
