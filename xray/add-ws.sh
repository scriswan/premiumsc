#!/bin/bash

dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
source /var/lib/SIJA/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi

tls="$(cat ~/log-install.txt | grep -w "Vmess TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vmess None TLS" | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m     CREATE XRAY/VMESS ACCOUNT      \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User : " -e user
		CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
            echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
            echo -e "\E[40;1;37m     CREATE XRAY/VMESS ACCOUNT     \E[0m"
            echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
v2ray-menu
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "limit Ip login : " limit
read -p "limit Quota GB : " quota
read -p "limit Bandwith GB :  " bw
read -p "Expired (days)	: " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmessgrpc$/a\### '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
acs=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "gw.ruangguru.com",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "${domain}",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
ask=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "quiz.vidio.com",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
grpc=`cat<<EOF
      {
      "v": "2",
      "ps": "${user}",
      "add": "104.26.7.171",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
vmess_base641=$( base64 -w 0 <<< $vmess_json1)
vmess_base642=$( base64 -w 0 <<< $vmess_json2)
vmess_base643=$( base64 -w 0 <<< $vmess_json3)
vmesslink1="vmess://$(echo $acs | base64 -w 0)"
vmesslink2="vmess://$(echo $ask | base64 -w 0)"
vmesslink3="vmess://$(echo $grpc | base64 -w 0)"
systemctl restart xray > /dev/null 2>&1
service cron restart > /dev/null 2>&1
clear
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m    💰CREATE XRAY/VMESS ACCOUNT💰       \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Domain      : ${domain}"
echo -e "Remarks     : ${user}" | tee -a /etc/log-create-user.log
echo -e "Limit Ip    : ${limit} IP" | tee -a /etc/log-create-user.log
echo -e "Limit Quota : ${quota} GB" | tee -a /etc/log-create-user.log
echo -e "Limit BW    : ${bw} GB" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "      📂IMPORT LINK TESL RGU PORT 443" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "${vmesslink1}" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "      📂IMPORT LINK XL VIDIO PORT 80" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "${vmesslink2}" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "      📂IMPORT LINK TESL IPED PORT 80" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "${vmesslink3}" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Aktif Selama : $masaaktif Hari"  
echo -e "Exp Jatuh pada : $exp"  
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
