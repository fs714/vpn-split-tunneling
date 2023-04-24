@echo off
%1 %2
ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof
:st
netsh interface ipv4 set interface interface=WLAN metric=2

copy "%~0" "%windir%\system32\"
cd /d %~dp0
rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME del.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK
rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME add.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK
