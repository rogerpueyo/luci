-- Copyright 2016 Roger Pueyo Centelles <roger.pueyo@guifi.net>
-- Licensed to the public under the Apache License 2.0.

local netmod = luci.model.network

local _, p
for _, p in ipairs({"gre", "gretap", "grev6", "grev6tap"}) do

	local proto = netmod:register_protocol(p)

	function proto.get_i18n(self)
		if p == "gre" then
			return luci.i18n.translate("GRE in IPv4 (RFC2784)")
		elseif p == "gretap" then
			return luci.i18n.translate("GRE-TAP in IPv4 (RFC2784)")
		elseif p == "grev6" then
			return luci.i18n.translate("GRE in IPv6 (RFC767)")
		elseif p == "grev6tap" then
			return luci.i18n.translate("GRE-TAP in IPv6 (RFC767)")
		end
	end

	function proto.ifname(self)
		return p .. "-" .. self.sid
	end

	function proto.opkg_package(self)
		if p == "gre" then
			return "gre"
		elseif p == "gretap" then
			return "gre"
		elseif p == "grev6" then
			return "gre"
		elseif p == "grev6tap" then
			return "gre"
		end
	end

	function proto.is_installed(self)
		if p == "gre" then
			return nixio.fs.access("/lib/netifd/proto/gre.sh")
		elseif p == "gretap" then
			return nixio.fs.access("/lib/netifd/proto/gre.sh")
		elseif p == "grev6" then
			return nixio.fs.access("/lib/netifd/proto/gre.sh")
		elseif p == "grev6tap" then
			return nixio.fs.access("/lib/netifd/proto/gre.sh")
		end
	end

	function proto.is_floating(self)
		if p == "gre" then
			return true
		elseif p == "gretap" then
			return true
		elseif p == "grev6" then
			return true
		elseif p == "grev6tap" then
			return true
		end
	end

	function proto.is_virtual(self)
		if p == "gre" then
			return true
		elseif p == "gretap" then
			return true
		elseif p == "grev6" then
			return true
		elseif p == "grev6tap" then
			return true
		end
	end

	function proto.get_interfaces(self)
		if self:is_floating() then
			return nil
		else
			return netmod.protocol.get_interfaces(self)
		end
	end

	function proto.contains_interface(self, ifc)
		if self:is_floating() then
			return (netmod:ifnameof(ifc) == self:ifname())
		else
			return netmod.protocol.contains_interface(self, ifc)
		end
	end

	netmod:register_pattern_virtual("^%s-%%w" % p)
end
