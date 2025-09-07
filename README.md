## Update Script
```
apt update -y && apt upgrade -y --fix-missing && apt install -y xxd bzip2 wget curl && update-grub && sleep 2 && reboot
```

## Installasi AutoScript
```
sysctl -w net.ipv6.conf.all.disable_ipv6=1 && sysctl -w net.ipv6.conf.default.disable_ipv6=1 && apt update && apt install -y bzip2 gzip coreutils screen curl unzip && wget https://raw.githubusercontent.com/scriswan/premiumsc/main/setup.sh && chmod +x setup.sh && sed -i -e 's/\r$//' setup.sh && screen -S setup ./setup.sh
```
## Update Manual
```
wget https://raw.githubusercontent.com/scriswan/premiumsc/main/update.sh && chmod +x update.sh && ./update.sh
```
## jika gagal install
```
screen -r -d setup
```
## AutoScript By RiswanStore
