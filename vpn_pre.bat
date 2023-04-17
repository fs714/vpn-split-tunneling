@echo off 
%1 %2 

mshta vbscript:createobject("shell.application").shellexecute("overture-windows-amd64.exe","","C:\Users\sfang\Documents\VPN\vpn-op\","runas",0)(window.close)
netsh interface ipv4 set dnsservers name=WLAN source=static address=127.0.0.1 register=primary validate=no
netsh interface ipv4 add dnsservers name=WLAN address=114.114.114.114 index=2 validate=no

ver|find "5.">nul&&goto :st 
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :st","","runas",1)(window.close)&goto :eof 
:st 
copy "%~0" "%windir%\system32\"
cd /d %~dp0
rundll32.exe cmroute.dll,SetRoutes /STATIC_FILE_NAME add.txt /DONT_REQUIRE_URL /IPHLPAPI_ACCESS_DENIED_OK