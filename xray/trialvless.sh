#!/bin/bash
domain=$(cat /etc/xray/domain)
tls="$(cat ~/log-install.txt | grep -w "Vless TLS" | cut -d: -f2|sed 's/ //g')"
none="$(cat ~/log-install.txt | grep -w "Vless None TLS" | cut -d: -f2|sed 's/ //g')"
user=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
sed -i '/#vless$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#vlessgrpc$/a\#& '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
vlesslink1="vless://${uuid}@${domain}:$tls?path=/vless&security=tls&encryption=none&type=ws#${user}"
vlesslink2="vless://${uuid}@${domain}:$none?path=/vless&encryption=none&type=ws#${user}"
vlesslink3="vless://${uuid}@${domain}:$tls?mode=gun&security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=bug.com#${user}"
systemctl restart xray
clear
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "\E[40;1;37m        🔹ACCOUNT TRIAL VLESS🔹 \E[0m"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Remarks        : ${user}"
echo -e "Domain         : ${domain}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Link TLS       : ${vlesslink1}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Link none TLS  : ${vlesslink2}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Link GRPC      : ${vlesslink3}"
echo -e "\e[33m───────────────────────────\033[0m"
echo -e "Aktif Selama   : $pup 60 menit"
echo -e "\E[40;1;37mJagan lupa order sesudah trial😁  \E[0m"
echo -e "\E[40;1;37mScript by @Riswanvpnstore  \E[0m"
echo -e "\e[33m───────────────────────────\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
