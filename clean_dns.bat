@echo off
%1 %2
ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof
:st
netsh interface ipv4 set dnsservers name=WLAN source=dhcp
wmic process where (commandline like "%%overture-windows-amd64.exe%%" and not name="wmic.exe") delete
