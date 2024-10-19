#!/bin/bash
yellow="\033[0;33m"
ungu="\033[0;35m"
Red="\033[91;1m"
Xark="\033[0m"
BlueCyan="\033[5;36m"
Cyan="\033[96;1m"
Purple="\033[95;1m"
Green="\033[92;1m"
WhiteBe="\033[5;37m"
GreenBe="\033[5;32m"
YellowBe="\033[5;33m"
BlueBe="\033[5;34m"
# . Liner 
function baris_panjang() {
  echo -e "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${Xark} "
}

function Lunatic_Banner() {
clear
baris_panjang
echo -e "\e[92;1m        AUTO SCRIPT LITE      ${Xark} "
baris_panjang
}

function Sc_Credit(){
sleep 1
baris_panjang
echo -e "\033[1;33m    Terimakasih Telah Menggunakan \033[0m"
echo -e "\033[1;33m       Script BY LITE VERMILION\033[0m"
baris_panjang
exit 1
}

# jalankan loading : sleep 0.8 & loading $!
loading() {
  local pid=$1
  local delay=0.1
  local spin='-\|/'

  while ps -p $pid > /dev/null; do
    local temp=${spin#?}
    printf "[%c] " "$spin"
    local spin=$temp${spin%"$temp"}
    sleep $delay
    printf "\b\b\b\b\b\b"
  done

  printf "    \b\b\b\b"
}



echo -e "\e[91;1m Delete Bot \e[0m"
sleep 2
rm -rf bot.sh
rm -rf bot.sh.1
cd /usr/bin
rm -rf cybervpn
rm -rf nenen

rm -rf add-vless.sh
rm -rf addss.sh
rm -rf addssh.sh
rm -rf addtr.sh
rm -rf addnoobz.sh
rm -rf addws.sh

rm -rf bot.sh
rm -rf bot.sh.bak

rm -rf cek-mms.sh
rm -rf cek-mts.sh
rm -rf cek-mvs.sh
rm -rf cek-mws.sh
rm -rf cek-noobz.sh

rm -rf cek-ss.sh
rm -rf cek-ssh.sh
rm -rf cek-tr.sh
rm -rf cek-vless.sh
rm -rf cek-ws.sh

rm -rf cybervpn.zip
rm -rf cybervpn.zip.bak
rm -rf del-bot
rm -rf del-vless.sh
rm -rf del-ws.sh
rm -rf del-tr.sh
rm -rf del-ss.sh

rm -rf log-install.txt
rm -rf panelbot.ah
rm -rf renew-ss.sh
rm -rf renew-vless.sh
rm -rf renewtr.sh
rm -rf renew-ssh.sh
rm -rf renewws.sh
rm -rf renewvless.sh
echo

# // Loading
sleep 2 & loading $!

clear

echo
echo
echo -e "\e[5;32m Restart Bot \e[0m"
echo
systemctl restart cybervpn
sleep 0.6 & loading $!
clear


Lunatic_Banner
baris_panjang
echo -e "\033[32m succesfully \033[0m"
echo
echo -e "\033[31m Deleted Bot Succes \033[0m"
echo
baris_panjang
Sc_Credit
echo
