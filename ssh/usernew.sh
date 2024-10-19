#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################
# Getting
clear
export CHATID=""
export KEY=""
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
sldomain=$(cat /root/nsdomain)
cdndomain=$(cat /root/awscdndomain)
slkey=$(cat /etc/slowdns/server.pub)
clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domeni=`cat /etc/xray/domain`
else
domeni=`cat /etc/v2ray/domain`
fi
domen=`cat /etc/xray/domain`
sldomain=`cat /etc/xray/nsdomain`
slkey=`cat /etc/slowdns/server.pub`
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`

echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m     CREATE SSH OPENVPN ACCOUNT    \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -p "Username : " Login
read -p "Password : " Pass
read -p "limit ip : " limit
read -p "Expired (Hari) : " masaaktif

IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`

sleep 1
clear
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

if [[ ! -z "${PID}" ]]; then
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m          🔹CREATE ACCOUNT SSH🔹       \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "domain   : $domen" | tee -a /etc/log-create-user.log
echo -e "Username : $Login" | tee -a /etc/log-create-user.log
echo -e "Password : $Pass" | tee -a /etc/log-create-user.log
echo -e "limit ip : $limit IP" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "UDP: $domen:1-65535@$Login:$Pass"  | tee -a /etc/log-create-user.log
echo -e "SSH: $domen:80@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Aktif Selama : $masaaktif Hari"  
echo -e "Exp Jatuh pada : $exp"  
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37mTerimakasih Kak Sudah Order 😘  \E[0m"
echo -e "\E[40;1;37mGaransi Jika Akun Masih Ada  \E[0m"
echo -e "\E[40;1;37mJagan lupa Perpanjang Ya  \E[0m"
echo -e "\E[40;1;37mTelegram @Riswanvpnstore  \E[0m"
echo -e "\E[40;1;37mGrup tele @grupvpnriswan  \E[0m"
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
else

echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m          🔹CREATE ACCOUNT SSH🔹       \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "domain   : $domen" | tee -a /etc/log-create-user.log
echo -e "Username : $Login" | tee -a /etc/log-create-user.log
echo -e "Password : $Pass" | tee -a /etc/log-create-user.log
echo -e "limit ip : $limit IP" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "UDP: $domen:1-65535@$Login:$Pass"  | tee -a /etc/log-create-user.log
echo -e "SSH: $domen:80@$Login:$Pass" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Aktif Selama : $masaaktif Hari"  
echo -e "Exp Jatuh pada : $exp"  
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37mTerimakasih Kak Sudah Order 😘  \E[0m"
echo -e "\E[40;1;37mGaransi Jika Akun Masih Ada  \E[0m"
echo -e "\E[40;1;37mJagan lupa Perpanjang Ya  \E[0m"
echo -e "\E[40;1;37mTelegram @Riswanvpnstore  \E[0m"
echo -e "\E[40;1;37mGrup tele @grupvpnriswan  \E[0m"
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
fi
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
