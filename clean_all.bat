@echo off
%1 %2

ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof

:st
netsh interface ipv4 set interface interface=WLAN metric=2
netsh interface ipv4 set dnsservers name=WLAN source=dhcp
wmic process where (commandline like "%%overture-windows-amd64.exe%%" and not name="wmic.exe") delete

copy "%~0" "%windir%\system32\"
cd /d %~dp0
rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME del.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK

netsh interface ipv4 set interface interface=WLAN metric=auto
