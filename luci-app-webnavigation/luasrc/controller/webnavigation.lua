-- Copyright 2021 sudodou <wsdoshb@gmail.com>
-- Licensed to the public under the Apache License 2.0.

module("luci.controller.webnavigation", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/webnavigation") then
		return
	end
--	entry({"admin", "status", "webnavigation"}, cbi("webnavigation"), _("Webnavigation"), 55).dependent = true
	entry({"admin", "status", "webnavigation", "config-subscribe"},cbi("webnavigation/config-subscribe"),_("Config Update超级无敌"), 60).leaf = true
	entry({"admin", "status", "webnavigation", "config-subscribe-edit"},cbi("webnavigation/config-subscribe-edit"), nil).leaf = true
end
