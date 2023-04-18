@echo off

echo "==============="
route print 1.0.1.0 | find "1.0.1.0"
echo.

echo "==============="
netsh interface ipv4 show dnsservers name=WLAN
echo.

echo "==============="
tasklist | find "overture"

timeout 5 > NUL
