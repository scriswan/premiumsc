#!/bin/bash

# Mendapatkan tanggal dari server Google
dateFromServer=$(curl -sI --insecure https://google.com/ | grep -i '^date:' | sed -e 's/Date: //')
biji=$(date +"%Y-%m-%d" -d "$dateFromServer")

# Fungsi untuk mencetak teks berwarna merah
red() { 
    echo -e "\\033[91;1m${*}\\033[0m"
}

clear

# Fungsi untuk loading
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

# Proses penghapusan bot dan file terkait
echo -e "\e[91;1m Delete Bot \e[0m"
sleep 2

# Hapus file di direktori /root
systemctl stop kyt

rm -rf /root/kyt.sh

# Hapus file di /usr/bin
cd /usr/bin || exit
rm -rf kyt kyt2 kyt3 kyt4 kyt5 kyt.zip kyt.zip.1 kyt.zip.2 kyt.zip.3 kyt.zip.4 kyt.zip.5 kyt2.zip kyt2.zip.1 kyt2.zip.2 kyt2.zip.3 kyt3.zip kyt3.zip.1 kyt3.zip.2 kyt3.zip.3 bot bot2 bot3 bot4 bot5 bot.zip bot.zip.1 bot.zip.2 bot.zip.3 bot.zip.4 bot.zip.5 bot-backup bot-cek-login-ssh bot-cek-ss \
       bot-cek-tr bot-cek-vless bot-cek-ws bot-member-ssh setting.py \
       bot-restore bot-vps-info

# Pesan setelah penghapusan
clear
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " \e[44;97;1m          BOT BERHASIL DI HAPUS           \033[0m"
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""
echo -e "  \033[1;91m update script service\033[1;37m"
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""

# Kembali ke menu setelah menekan tombol Enter
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
