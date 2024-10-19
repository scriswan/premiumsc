#!/bin/bash
domain=$(cat /etc/xray/domain)
tr="$(cat ~/log-install.txt | grep -w "Trojan WS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

systemctl restart xray
trojanlink1="trojan://${uuid}@${domain}:${tr}?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=bug.com#${user}"
trojanlink="trojan://${uuid}@isi_bug_disini:${tr}?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
clear
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "\E[40;1;37m       🔹ACCOUNT TRIAL TROJAN🔹\E[0m"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Remarks      : ${user}"
echo -e "Host/IP      : ${domain}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Link WS      : ${trojanlink}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Link GRPC    : ${trojanlink1}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Aktif Selama   : $pup 60 menit"
echo -e "\E[40;1;37mJagan lupa order sesudah trial😁  \E[0m"
echo -e "\E[40;1;37mScript by @Riswanvpnstore  \E[0m"
echo -e "\e[33m───────────────────────────\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
