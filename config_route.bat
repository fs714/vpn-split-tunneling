@echo off
%1 %2
ver|find "5.">nul&&goto :st
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof
:st
:: - Problem
::   - StrongVPN V2 Client set VPN interface metric to 0
::   - Windows will use DNS server on lowest metric interface, that is StrongVPN TAP Interface, not our WLAN interface
::   - Next hop of China IP will be configured to Default GW interface which is also the lowest metric interface
:: - Solution
::   - Set VPN interface to higher metric and WLAN interface to lower metric
::   - Set VPN interface DNS to static as 127.0.0.1
::   - Interface 12 is my VPN interface index, you can find your VPN inteface index by 'netsh int ipv4 show interfaces'
netsh interface ipv4 set interface interface=12 metric=10
netsh interface ipv4 set interface interface=WLAN metric=1

copy "%~0" "%windir%\system32\"
cd /d %~dp0
rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME del.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK
rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME add.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK
