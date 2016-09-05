-- Copyright 2016 Roger Pueyo Centelles <roger.pueyo@guifi.net>
-- Licensed to the public under the Apache License 2.0.

local map, section, net = ...

local peer6addr, ip6addr, tunlink, weakif, mtu, ttl, tos, zone, ikey, okey, icsum, ocsum, iseqno, oseqno, df


peer6addr = section:taboption("general", Value, "peer6addr", translate("Remote IPv6 address"), translate("The IPv6 address of the remote tunnel end."))
peer6addr.optional = false
peer6addr.datatype = "ip6addr"

ip6addr = section:taboption("general", Value, "ip6addr", translate("Local IPv6 address"), translate("The local IPv6 address over which the tunnel is created (optional)."))
ip6addr.optional = true
ip6addr.datatype = "ip6addr"

tunlink = section:taboption("general", Value, "tunlink", translate("Bind interface"), translate("Bind the tunnel to this interface (optional)."))
tunlink.optional = true

weakif = section:taboption("general", Value, "weakif", translate("weakif"), translate("weakif."))
weakif.optional = true


mtu = section:taboption("advanced", Value, "mtu", translate("Override MTU"), translate("Specify an MTU (Maximum Transmission Unit) other than the default (1280 bytes)."))
mtu.optional = true
mtu.placeholder = 1280
mtu.datatype = "and(min(68),max(9200))"

ttl = section:taboption("advanced", Value, "ttl", translate("Override TTL"), translate("Specify a TTL (Time to Live) for the encapsulating packet other than the default (64)."))
ttl.optional = truev
ttl.placeholder = 64
ttl.datatype = "min(1)"

tos = section:taboption("advanced", Value, "tos", translate("Set TOS"), translate("Specify a TOS (Type of Service)."))
tos.optional = true
tos.datatype = "and(min(0),max(255))"

okey = section:taboption("advanced", Value, "okey", translate("Set output key"), translate("Use keyed GRE for outgoing packets (an IPv4 address or a number)"))
okey.optional = true
okey.datatype = "or(min(0),ip4addr)"

ikey = section:taboption("advanced", Value, "ikey", translate("Set input key"), translate("Use keyed GRE for incomming packets (an IPv4 address or a number)"))
ikey.optional = true
ikey.datatype = "or(min(0),ip4addr)"

multicast = section:taboption("advanced", Flag, "multicast", translate("Enable multicast"), translate("Multicast support is enabled by default on GRE/GRE-TAP tunnels, as they are often used in combination with routing protocols using multicast."))
multicast.rmempty = false

ocsum = section:taboption("advanced", Flag, "ocsum", translate("Add checksums"), translate("Add a checksum to all outgoing packets (ocsum flag)."))

icsum = section:taboption("advanced", Flag, "icsum", translate("Require checksums"), translate("Require that all input packets have the correct checksum (icsum flag)."))

oseqno = section:taboption("advanced", Flag, "oseqno", translate("Add serialization"), translate("Add a sequencing number of outgoing packets (oseqno flag)."))

iseqno = section:taboption("advanced", Flag, "iseqno", translate("Require serialization"), translate("Require that all input packets are serialized (iseq flag)."))
