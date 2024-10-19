#!/bin/bash

# Fungsi untuk mencetak teks berwarna merah
red() { 
    echo -e "\\033[91;1m${*}\\033[0m"
}

clear

# Fungsi untuk menampilkan loading bar
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    
    tput civis
    echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        
        if [[ -e $HOME/fim ]]; then
            rm $HOME/fim
            break
        fi
        
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mPlease Wait Loading \033[1;37m- \033[0;33m["
    done
    
    echo -e "\033[0;33m]\033[1;37m - \033[1;32mOK !\033[1;37m"
    tput cnorm
}

# Fungsi untuk merestart service bot
res1() {
    systemctl restart cybervpn
    systemctl restart xbot
}

# Menjalankan netfilter-persistent
netfilter-persistent

clear

# Tampilan pesan restart bot service
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e " \033[1;97;41m          MEMULAI ULANG BOT           \033[0m"
echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""
echo -e "  \033[1;91m Memulai ulang layanan script\033[1;37m"

# Menjalankan loading bar saat restart service
fun_bar 'res1'

echo -e "\033[97m◇━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━◇\033[0m"
echo -e ""

# Kembali ke menu setelah menekan tombol Enter
read -n 1 -s -r -p "Press [ Enter ] to back on menu"
menu
