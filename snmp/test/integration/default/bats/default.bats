#!/usr/bin/env bats

@test "/etc/snmp/snmpd.conf file exists" {
  test -f /etc/snmp/snmpd.conf 
}

@test "snmpd is running" {
  ps -e|grep snmpd
}
