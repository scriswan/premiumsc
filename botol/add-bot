#!/bin/bash
NS=$( cat /etc/xray/dns )
PUB=$( cat /etc/slowdns/server.pub )
domain=$(cat /etc/xray/domain)


cd /etc/systemd/system/
rm -rf kyt.service
cd
grenbo="\e[92;1m"
NC='\e[0m'

cd /usr/bin
rm -rf kyt
rm kyt.*
rm -rf bot
rm bot.*
apt update && apt upgrade
apt install neofetch -y
apt install python3 python3-pip git
cd /usr/bin
wget https://raw.githubusercontent.com/Lite-VPN/v3/main/bot/bot.zip
unzip bot.zip
mv bot/* /usr/bin
chmod +x /usr/bin/*
rm -rf bot.zip
clear
wget https://raw.githubusercontent.com/Lite-VPN/v3/main/bot/kyt.zip
unzip kyt.zip
pip3 install -r kyt/requirements.txt
clear


echo ""
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e " \e[1;97;101m        ADD BOT CREATE PRIVATE          \e[0m"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "${grenbo}Tutorial Creat Bot and ID Telegram${NC}"
echo -e "${grenbo}[*] Creat Bot and Token Bot : @BotFather${NC}"
echo -e "${grenbo}[*] Info Id Telegram : @MissRose_bot , perintah /info${NC}"
echo -e "\033[1;36m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -e -p "[*] Input your Bot Token : " bottoken
read -e -p "[*] Input Your Id Telegram :" admin
echo -e BOT_TOKEN='"'$bottoken'"' >> /usr/bin/kyt/var.txt
echo -e ADMIN='"'$admin'"' >> /usr/bin/kyt/var.txt
echo -e DOMAIN='"'$domain'"' >> /usr/bin/kyt/var.txt
echo -e PUB='"'$PUB'"' >> /usr/bin/kyt/var.txt
echo -e HOST='"'$NS'"' >> /usr/bin/kyt/var.txt
echo -e "#bot# $bottoken $admin" >/etc/bot/.bot.db
clear

cat > /etc/systemd/system/kyt.service << END
[Unit]
Description=Simple kyt - @kyt
After=network.target

[Service]
WorkingDirectory=/usr/bin
ExecStart=/usr/bin/python3 -m kyt
Restart=always

[Install]
WantedBy=multi-user.target
END

systemctl start kyt 
systemctl enable kyt
systemctl restart kyt

echo -e " \033[1;97;41m     MENDOWNLOAD ASSET TAMBAHAN......    \033[0m"





wget -q -O /usr/bin/addnoobz "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/addnoobz.sh" && chmod +x /usr/bin/addnoobz






wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/add-vless.sh" && chmod +x /usr/bin/add-vless

wget -q -O /usr/bin/addtr "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/addtr.sh" && chmod +x /usr/bin/addtr


wget -q -O /usr/bin/addws "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/addws.sh" && chmod +x /usr/bin/addws


wget -q -O /usr/bin/addss "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/addss.sh" && chmod +x /usr/bin/addss

wget -q -O /usr/bin/cek-ssh "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-ssh.sh" && chmod +x /usr/bin/cek-ssh



wget -q -O /usr/bin/cek-ss "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-ss.sh" && chmod +x /usr/bin/cek-ss




wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-tr.sh" && chmod +x /usr/bin/cek-tr

wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-vless.sh" && chmod +x /usr/bin/cek-vless

wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-ws.sh" && chmod +x /usr/bin/cek-ws

wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/del-vless.sh" && chmod +x /usr/bin/del-vless




wget -q -O /usr/bin/cek-noobz "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-noobz.sh" && chmod +x /usr/bin/cek-noobz



wget -q -O /usr/bin/deltr "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/deltr.sh" && chmod +x /usr/bin/deltr

wget -q -O /usr/bin/delws "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/delws.sh" && chmod +x /usr/bin/delws



wget -q -O /usr/bin/delss "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/delss.sh" && chmod +x /usr/bin/delss



wget -q -O /usr/bin/renew-ss "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/renew-ss.sh" && chmod +x /usr/bin/renew-ss


wget -q -O /usr/bin/renewtr "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/renewtr.sh" && chmod +x /usr/bin/renewtr


wget -q -O /usr/bin/renewvless "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/renewvless.sh" && chmod +x /usr/bin/renewvless


wget -q -O /usr/bin/renewws "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/renewws.sh" && chmod +x /usr/bin/renewws


wget -q -O /usr/bin/cek-mws "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-mws.sh" && chmod +x /usr/bin/cek-mws

wget -q -O /usr/bin/cek-mvs "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-mvs.sh" && chmod +x /usr/bin/cek-mvs


wget -q -O /usr/bin/cek-mss "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-mss.sh" && chmod +x /usr/bin/cek-mss



wget -q -O /usr/bin/cek-mts "https://raw.githubusercontent.com/Lite-VPN/v3/main/ping/cek-mts.sh" && chmod +x /usr/bin/cek-mts

cd /root
rm -rf kyt.sh
echo "Done"
echo "Your Data Bot"
echo -e "==============================="
echo "Token Bot         : $bottoken"
echo "Admin          : $admin"
echo "Domain        : $domain"
echo -e "==============================="
echo "Setting done"
clear

echo " Installations complete, type /menu on your bot"
