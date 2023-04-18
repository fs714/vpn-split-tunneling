@echo off
%1 %2
ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof
:st
mshta vbscript:createobject("shell.application").shellexecute("overture-windows-amd64.exe","","%~dp0","runas",0)(window.close)
netsh interface ipv4 set dnsservers name=WLAN source=static address=127.0.0.1 register=primary validate=no
netsh interface ipv4 add dnsservers name=WLAN address=114.114.114.114 index=2 validate=no
