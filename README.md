## INSTALL SCRIPT 
Masukkan perintah dibawah untuk menginstall Autoscript
```
apt update -y && apt upgrade -y --fix-missing && apt install -y xxd bzip2 wget curl && update-grub && sleep 2 && sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
## INSTALL UDP COSTUM
```
wget https://raw.githubusercontent.com/gemilangvip/autoscript/main/files/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh
```
## UPDATE SC MANUAL 1
```
wget https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/update.sh
```
## UPDATE SC MANUAL 2
```
chmod +x update.sh && ./update.sh
```
