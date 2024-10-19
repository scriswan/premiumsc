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
tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[40;1;37m           TROJAN ACCOUNT          \E[0m"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"

		read -rp "User : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
		echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
		echo -e "\E[40;1;37m           TROJAN ACCOUNT          \E[0m"
		echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
			read -n 1 -s -r -p "Press any key to back on menu"
			menu-trojan
		fi
	done

uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (Days)	: " masaaktif
read -p "limit Ip ( DEVIC ) : " limit
read -p "limit Quota ( GB ) : " quota
read -p "limit Bandwith ( GB ) :  " bw 
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37m        🔹CREATE ACCOUNT TROJAN🔹     \E[0m" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Domain       : ${domain}"
echo -e "Remarks      : ${user}" | tee -a /etc/log-create-user.log
echo -e "Limit Ip     : ${limit} IP" | tee -a /etc/log-create-user.log
echo -e "Limit Quota  : ${quota} GB" | tee -a /etc/log-create-user.log
echo -e "Limit BW     : ${bw} GB" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link WS      : ${trojanlink}" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Link GRPC    : ${trojanlink1}" | tee -a /etc/log-create-user.log
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "Aktif: $masaaktif Hari"
echo -e "Exp Pada: $exp" 
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo -e "\E[40;1;37mTerimakasih Sudah Order😘  \E[0m"
echo -e "\E[40;1;37mGaransi Kami Pull sampe exp  \E[0m"
echo -e "\E[40;1;37mBy t.me/Riswanvpnstore  \E[0m"
echo -e "\E[40;1;37mGrup tele t.me/grupvpnriswan  \E[0m"
echo -e "\e[33m───────────────────────────\033[0m" | tee -a /etc/log-create-user.log
echo "" | tee -a /etc/log-create-user.log
read -n 1 -s -r -p "Press any key to back on menu"
menu
