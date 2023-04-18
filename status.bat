@echo off

echo "==============="
echo | set /p dummyName="Route Table Lines: "
netstat -r | find /v /c ""
echo. 

echo "==============="
netsh interface ipv4 show dnsservers name=WLAN

timeout 5 > NUL
