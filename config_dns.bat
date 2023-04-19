@echo off
%1 %2

ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof

:st
:: Start overture service
mshta vbscript:createobject("shell.application").shellexecute("overture-windows-amd64.exe","","%~dp0","runas",0)(window.close)
:: Set WLAN interface metric to higher priority, then configured DNS server could be used by system firstly
netsh interface ipv4 set interface interface=WLAN metric=2
:: Set WLAN interface primary DNS server to overture
netsh interface ipv4 set dnsservers name=WLAN source=static address=127.0.0.1 register=primary validate=no
:: Set WLAN interface alternative DNS server to 114.114.114.114 which is useful when overture not started
netsh interface ipv4 add dnsservers name=WLAN address=114.114.114.114 index=2 validate=no
