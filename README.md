## INSTALL SCRIPT 
Masukkan perintah dibawah untuk menginstall Autoscript
## Step 1
```
apt update -y && apt upgrade -y --fix-missing && apt install -y xxd bzip2 wget curl && update-grub && sleep 2 && reboot
```
## Step 2
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
## UPDATE SCRIPT
```
wget https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/update.sh && chmod +x update.sh && ./update.sh
```
