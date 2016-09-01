-- Copyright 2016 Roger Pueyo Centelles <roger.pueyo@guifi.net>
-- Licensed to the public under the Apache License 2.0.

local map, section, net = ...

local peeraddr, ipaddr, tunlink, mtu, ttl, tos, zone, ikey, okey, icsum, ocsum, iseqno, oseqno, df


peeraddr = section:taboption("general", Value, "peeraddr", translate("Remote IPv4 address"), translate("The IPv4 address of the remote tunnel end."))
peeraddr.optional = false
peeraddr.datatype = "ip4addr"

ipaddr = section:taboption("general", Value, "ipaddr", translate("Local IPv4 address"), translate("The local IPv4 address over which the tunnel is created (optional)."))
ipaddr.optional = true
ipaddr.datatype = "ip4addr"

tunlink = section:taboption("general", Value, "tunlink", translate("Bind interface"), translate("Bind the tunnel to this interface (optional)."))
ipaddr.optional = true


mtu = section:taboption("advanced", Value, "mtu", translate("Override MTU"), translate("Specify an MTU (Maximum Transmission Unit) other than the default (1280 bytes)."))
mtu.optional = true
mtu.placeholder = 1280
mtu.datatype = "and(min(68),max(9200))"

ttl = section:taboption("advanced", Value, "ttl", translate("Override TTL"), translate("Specify a TTL (Time to Live) for the encapsulating packet other than the default (64)."))
ttl.optional = true
ttl.placeholder = 64
ttl.datatype = "min(1)"

tos = section:taboption("advanced", Value, "tos", translate("Set TOS"), translate("Specify a TOS (Type of Service)."))
tos.optional = true
tos.datatype = "and(min(0),max(255))"

ikey = section:taboption("advanced", Value, "ikey", translate("ikey"), translate("ikey"))
ikey.optional = true
ikey.datatype = "or(ip4addr,uint)"

okey = section:taboption("advanced", Value, "okey", translate("okey"), translate("okey"))
okey.optional = true
okey.datatype = "or(ip4addr,uint)"

icsum = section:taboption("advanced", Flag, "icsum", translate("icsum"), translate("icsum."))

ocsum = section:taboption("advanced", Flag, "ocsum", translate("ocsum"), translate("ocsum."))

iseqno = section:taboption("advanced", Flag, "iseqno", translate("iseqno"), translate("iseqno."))

oseqno = section:taboption("advanced", Flag, "oseqno", translate("oseqno"), translate("oseqno."))

df = section:taboption("advanced", Flag, "df", translate("Don't Fragment"), translate("Enable the DF (Don't Fragment) flag of the encapsulating packets."))
