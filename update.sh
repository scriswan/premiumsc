#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
echo ""
version=$(cat /home/ver)
ver=$( curl https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/version )
clear
line=$(cat /etc/line)
below=$(cat /etc/below)
back_text=$(cat /etc/back)
number=$(cat /etc/number)
box=$(cat /etc/box)
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(OLD VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available${Red_font_prefix}[Please Update]${Font_color_suffix}"
version=$(cat /home/ver)
new_version=$( curl https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/version | grep $version )
if [ $version = $new_version ]; then
sts="${Info2}"
else
sts="${Error}"
fi
clear
loading() {
  local pid=$1
  local delay=0.1
  local spin='-\|/'

  while ps -p "$pid" > /dev/null; do
    printf "[%c] " "$spin"
    spin=${spin#?}${spin%"${spin#?}"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done

  printf "    \b\b\b\b"
}

cd /usr/bin
sleep 2 & loading $! & wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/usernew.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/auto-reboot "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/auto-reboot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/restart.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/tendang.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/clearcache "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/clearcache.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/running "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/running.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/speedtest_cli.py"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-vless "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-vless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-vmess "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-vmess.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-trojan "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-trojan.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-ssh "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-ssh.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-backup.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu1 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/theme/menu1.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu2 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/theme/menu2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu3 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/theme/menu3.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu4 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/theme/menu4.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu5 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/theme/menu5.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-webmin "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-webmin.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/xp "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/xp.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/update "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/update.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/add-host.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/certv2ray "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/certv2ray.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-set "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-set.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/about "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/about.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-backup "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-backup.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/trial.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/ssh/usernew.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/add-tr.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/del-tr.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/cek-tr.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/trialtrojan "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/trialtrojan.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/renew-tr.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/add-ws.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/del-ws.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/cek-ws.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/renew-ws.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/trialvmess "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/trialvmess.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/add-vless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/del-vless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/cek-vless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/renew-vless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/trialvless "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/xray/trialvless.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-trial "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-trial.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-theme "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/theme/menu-theme.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/bot2 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-bot "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/add-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/add-bot-bersama "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/add-bot-bersama.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/bot-bansos "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/bot-bansos.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/stop-bot "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/stop-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/stop-bot2 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/stop-bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restart-bot "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/restart-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/restart-bot2 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/restart-bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/hapus-bot "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/hapus-bot.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/del-bot2 "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/bot/del-bot2.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/update "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/update.sh"
sleep 2 & loading $! & wget -q -O /usr/bin/menu-bot "https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/menu/menu-bot.sh"
sleep 2 & loading $! & chmod +x /usr/bin/usernew
sleep 2 & loading $! & chmod +x /usr/bin/auto-reboot
sleep 2 & loading $! & chmod +x /usr/bin/restart
sleep 2 & loading $! & chmod +x /usr/bin/tendang
sleep 2 & loading $! & chmod +x /usr/bin/clearcache
sleep 2 & loading $! & chmod +x /usr/bin/running
sleep 2 & loading $! & chmod +x /usr/bin/speedtest
sleep 2 & loading $! & chmod +x /usr/bin/menu-vless
sleep 2 & loading $! & chmod +x /usr/bin/menu-vmess
sleep 2 & loading $! & chmod +x /usr/bin/menu-theme
sleep 2 & loading $! & chmod +x /usr/bin/menu1
sleep 2 & loading $! & chmod +x /usr/bin/menu2
sleep 2 & loading $! & chmod +x /usr/bin/menu3
sleep 2 & loading $! & chmod +x /usr/bin/menu4
sleep 2 & loading $! & chmod +x /usr/bin/menu5
sleep 2 & loading $! & chmod +x /usr/bin/menu-trojan
sleep 2 & loading $! & chmod +x /usr/bin/menu-ssh
sleep 2 & loading $! & chmod +x /usr/bin/menu-backup
sleep 2 & loading $! & chmod +x /usr/bin/menu
sleep 2 & loading $! & chmod +x /usr/bin/menu-webmin
sleep 2 & loading $! & chmod +x /usr/bin/xp
sleep 2 & loading $! & chmod +x /usr/bin/update
sleep 2 & loading $! & chmod +x /usr/bin/add-host
sleep 2 & loading $! & chmod +x /usr/bin/certv2ray
sleep 2 & loading $! & chmod +x /usr/bin/menu-set
sleep 2 & loading $! & chmod +x /usr/bin/about
sleep 2 & loading $! & chmod +x /usr/bin/add4
sleep 2 & loading $! & chmod +x /usr/bin/menu-backup
sleep 2 & loading $! & chmod +x /usr/bin/trial
sleep 2 & loading $! & chmod +x /usr/bin/usernew
sleep 2 & loading $! & chmod +x /usr/bin/add-tr
sleep 2 & loading $! & chmod +x /usr/bin/del-tr
sleep 2 & loading $! & chmod +x /usr/bin/cek-tr
sleep 2 & loading $! & chmod +x /usr/bin/trialtrojan
sleep 2 & loading $! & chmod +x /usr/bin/renew-tr
sleep 2 & loading $! & chmod +x /usr/bin/add-ws
sleep 2 & loading $! & chmod +x /usr/bin/del-ws
sleep 2 & loading $! & chmod +x /usr/bin/cek-ws
sleep 2 & loading $! & chmod +x /usr/bin/renew-ws
sleep 2 & loading $! & chmod +x /usr/bin/trialvmess
sleep 2 & loading $! & chmod +x /usr/bin/add-vless
sleep 2 & loading $! & chmod +x /usr/bin/del-vless
sleep 2 & loading $! & chmod +x /usr/bin/cek-vless
sleep 2 & loading $! & chmod +x /usr/bin/renew-vless
sleep 2 & loading $! & chmod +x /usr/bin/trialvless
sleep 2 & loading $! & chmod +x /usr/bin/menu-trial
sleep 2 & loading $! & chmod +x /usr/bin/bot2
sleep 2 & loading $! & chmod +x /usr/bin/add-bot
sleep 2 & loading $! & chmod +x /usr/bin/add-bot-bersama
sleep 2 & loading $! & chmod +x /usr/bin/bot-bansos
sleep 2 & loading $! & chmod +x /usr/bin/stop-bot
sleep 2 & loading $! & chmod +x /usr/bin/stop-bot2
sleep 2 & loading $! & chmod +x /usr/bin/restart-bot
sleep 2 & loading $! & chmod +x /usr/bin/restart-bot2
sleep 2 & loading $! & chmod +x /usr/bin/hapus-bot
sleep 2 & loading $! & chmod +x /usr/bin/del-bot2
sleep 2 & loading $! & chmod +x /usr/bin/update
sleep 2 & loading $! & sed -i 's/\r$//' /usr/bin/menu-bot
sleep 2 & loading $! & chmod +x /usr/bin/menu-bot

echo

# Loading saat sleep
sleep 2 & loading $!

clear


sleep 0.6 & loading $!
clear
cd
rm -f update.sh
clear
echo -e "Downloaded successfully!!!"
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
