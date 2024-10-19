#!/bin/bash
yellow="\033[0;33m"
ungu="\033[0;35m"
red="\033[91;1m"
xark="\033[0m"
blueCyan="\033[5;36m"
cyan="\033[96;1m"
purple="\033[95;1m"
green="\033[92;1m"
whiteBe="\033[5;37m"
greenBe="\033[5;32m"
yellowBe="\033[5;33m"
blueBe="\033[5;34m"

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

echo -e "\e[91;1m Delete Bot \e[0m"
sleep 2

# Hapus file di direktori home
rm -rf bot.sh bot.sh.1 bot.sh.bak

# Hapus file di /usr/bin
cd /usr/bin || exit

rm -rf cybervpn nenen add-vless.sh addss.sh addssh.sh addtr.sh \
        addnoobz.sh addws.sh cek-mms.sh cek-mts.sh cek-mvs.sh \
        cek-mws.sh cek-noobz.sh cek-ss.sh cek-ssh.sh cek-tr.sh \
        cek-vless.sh cek-ws.sh cybervpn.zip cybervpn.zip.bak \
        del-bot del-vless.sh del-ws.sh del-tr.sh del-ss.sh \
        log-install.txt panelbot.ah renew-ss.sh renew-vless.sh \
        renewtr.sh renew-ssh.sh renewws.sh renewvless.sh

echo

# Loading saat sleep
sleep 2 & loading $!

clear

echo
echo
echo -e "\e[5;32m Restart Bot \e[0m"
echo
systemctl restart cybervpn
sleep 0.6 & loading $!
clear

# Informasi bot berhasil dihapus
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " \033[1;97;41m          BOT BERHASIL DI HAPUS           \033[0m"
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
