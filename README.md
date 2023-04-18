# vpn-split-tunneling
## 1. How to run it in Windows
### 1.1 Config Route
- `config_route.bat`: Config route for China IPs to Default Gateway Interface
- `clean_route.bat`:  Delete route for China IPs

### 1.2 Config DNS
- `config_dns.bat`: Start `overture` and set DNS to 127.0.0.1 and 114.114.114.114
- `clean_dns.bat`:  Stop`overture` and set DNS to DHCP

### 1.3 Config All
- `config_all.bat`: Config both route and dns
- `clean_all.bat`:  Clean both route and dns

### 1.4 Show Current Status
- `status.bat`

## 2. How to update resources files
- Update scripts are Linux shell script, you can execute them by Git Bash
- `update_dns_resources.sh` will update follow files
  - china_ip_list.txt
  - china_list.txt
  - gfw_list.txt
- `update_route_resources.sh` will update follow files
  - add.txt
  - del.txt
- `update_route_resources.sh` should be executed after `update_dns_resources.sh` since `china_ip_list.txt` is required
- `update_all.sh` will update all related files
