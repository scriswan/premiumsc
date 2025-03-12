#!/bin/bash

BURIQ () {
    # Mengunduh daftar register dari URL baru dan menyimpannya ke dalam file sementara
    curl -sS https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/register > /root/tmp
    
    # Mendapatkan IP pengguna saat ini
    MYIP=$(curl -sS ipv4.icanhazip.com)
    
    # Mencari entri yang memiliki IP yang sama dengan pengguna saat ini
    entry=$(grep -E " $MYIP" /root/tmp)
    
    # Jika entri ditemukan, proses tanggal kedaluwarsa
    if [[ -n "$entry" ]]; then
        # Mengambil nama pengguna dan tanggal kedaluwarsa dari entri tersebut
        user=$(echo "$entry" | awk '{print $2}')
        exp=$(echo "$entry" | awk '{print $3}')
        
        # Mengonversi tanggal kedaluwarsa dan tanggal hari ini ke detik sejak epoch
        d1=$(date -d "$exp" +%s)
        d2=$(date +%s) # Hari ini
        
        # Menghitung selisih hari antara hari ini dan tanggal kedaluwarsa
        exp2=$(( (d1 - d2) / 86400 ))
        
        # Jika waktu habis (expired)
        if [[ "$exp2" -le "0" ]]; then
            echo $user > /etc/.$user.ini
        else
            rm -f /etc/.$user.ini > /dev/null 2>&1
        fi
    fi

    # Menghapus file sementara
    rm -f /root/tmp
}

# Mendapatkan IP pengguna saat ini
MYIP=$(curl -sS ipv4.icanhazip.com)

# Mendapatkan nama berdasarkan IP yang sesuai di file register
Name=$(curl -sS https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/register | grep $MYIP | awk '{print $2}')

# Menyimpan nama ke file .ini untuk pemeriksaan izin
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
    # Memeriksa apakah file izin untuk user ada
    if [ -f "/etc/.$Name.ini" ]; then
        CekTwo=$(cat /etc/.$Name.ini)
        
        # Memeriksa apakah nama pada file izin cocok
        if [ "$CekOne" = "$CekTwo" ]; then
            res="Expired"
        fi
    else
        res="Permission Accepted..."
    fi
}

PERMISSION () {
    # Mendapatkan IP pengguna
    MYIP=$(curl -sS ipv4.icanhazip.com)
    
    # Memeriksa apakah IP ada di daftar register
    IZIN=$(curl -sS https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/register | awk '{print $4}' | grep $MYIP)
    
    if [ "$MYIP" = "$IZIN" ]; then
        Bloman
    else
        res="Permission Denied!"
    fi
    
    BURIQ
}

# Menjalankan fungsi PERMISSION untuk memulai
PERMISSION
if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
else
Exp=$(curl -sS https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/register | grep $MYIP | awk '{print $3}')
fi
vlx=$(grep -c -E "^#& " "/etc/xray/config.json")
let vla=$vlx/2
vmc=$(grep -c -E "^### " "/etc/xray/config.json")
let vma=$vmc/2
ssh1="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
trx=$(grep -c -E "^#! " "/etc/xray/config.json")
let tra=$trx/2
ssx=$(grep -c -E "^## " "/etc/xray/config.json")
let ssa=$ssx/2
UDPX="https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1S3IE25v_fyUfCLslnujFBSBMNunDHDk2"
# Fungsi Anti DC dengan Ping
anti_dc () {
    while true; do
        # Mengirim ping ke server atau IP tertentu
        ping -c 1 8.8.8.8 > /dev/null
        
        # Menunggu beberapa detik sebelum mengirim ping lagi
        sleep 10
    done
}

# Jalankan anti_dc di background
anti_dc &

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
w="\033[97m"
ORANGE="\033[0;34m"
NC='\e[0m'
dtoday="$(vnstat -i eth0 | grep "today" | awk '{print $2" "substr ($3, 1, 1)}')"
utoday="$(vnstat -i eth0 | grep "today" | awk '{print $5" "substr ($6, 1, 1)}')"
ttoday="$(vnstat -i eth0 | grep "today" | awk '{print $8" "substr ($9, 1, 1)}')"
dyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $2" "substr ($3, 1, 1)}')"
uyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $5" "substr ($6, 1, 1)}')"
tyest="$(vnstat -i eth0 | grep "yesterday" | awk '{print $8" "substr ($9, 1, 1)}')"
dmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $3" "substr ($4, 1, 1)}')"
umon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $6" "substr ($7, 1, 1)}')"
tmon="$(vnstat -i eth0 -m | grep "`date +"%b '%y"`" | awk '{print $9" "substr ($10, 1, 1)}')"
clear
tram=$( free -h | awk 'NR==2 {print $2}' )
uram=$( free -h | awk 'NR==2 {print $3}' )
ISP=$(curl -s ipinfo.io/org | cut -d " " -f 2-10 )
CITY=$(curl -s ipinfo.io/city )
cpu_usage1="$(ps aux | awk 'BEGIN {sum=0} {sum+=$3}; END {print sum}')"
cpu_usage="$((${cpu_usage1/\.*} / ${corediilik:-1}))"
cpu_usage+=" %"
total_ram=` grep "MemTotal: " /proc/meminfo | awk '{ print $2}'`
totalram=$(($total_ram/1024))
persenmemori="$(echo "scale=2; $usmem*100/$tomem" | bc)"
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"
clear
clear && clear && clear
clear;clear;clear
cek=$(service ssh status | grep active | cut -d ' ' -f5)
if [ "$cek" = "active" ]; then
stat=-f5
else
stat=-f7
fi
ssh=$(service ssh status | grep active | cut -d ' ' $stat)
if [ "$ssh" = "active" ]; then
ressh="${green}ON${NC}"
else
ressh="${red}OFF${NC}"
fi
sshstunel=$(service stunnel4 status | grep active | cut -d ' ' $stat)
if [ "$sshstunel" = "active" ]; then
resst="${green}ON${NC}"
else
resst="${red}OFF${NC}"
fi
sshws=$(service ws-stunnel status | grep active | cut -d ' ' $stat)
if [ "$sshws" = "active" ]; then
ressshws="${green}ON${NC}"
else
ressshws="${red}OFF${NC}"
fi
ngx=$(service nginx status | grep active | cut -d ' ' $stat)
if [ "$ngx" = "active" ]; then
resngx="${green}ON${NC}"
else
resngx="${red}OFF${NC}"
fi
dbr=$(service dropbear status | grep active | cut -d ' ' $stat)
if [ "$dbr" = "active" ]; then
resdbr="${green}ON${NC}"
else
resdbr="${red}OFF${NC}"
fi
v2r=$(service xray status | grep active | cut -d ' ' $stat)
if [ "$v2r" = "active" ]; then
resv2r="${green}ON${NC}"
else
resv2r="${red}OFF${NC}"
fi
function addhost(){
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
read -rp "Domain/Host: " -e host
echo ""
if [ -z $host ]; then
echo "????"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
read -n 1 -s -r -p "Press any key to back on menu"
setting-menu
else
echo "IP=$host" > /var/lib/scrz-prem/ipvps.conf
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "Dont forget to renew cert"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
}
function genssl(){
clear
systemctl stop nginx
domain=$(cat /var/lib/scrz-prem/ipvps.conf | cut -d'=' -f2)
Cek=$(lsof -i:80 | cut -d' ' -f1 | awk 'NR==2 {print $1}')
if [[ ! -z "$Cek" ]]; then
sleep 1
echo -e "[ ${red}WARNING${NC} ] Detected port 80 used by $Cek "
systemctl stop $Cek
sleep 2
echo -e "[ ${green}INFO${NC} ] Processing to stop $Cek "
sleep 1
fi
echo -e "[ ${green}INFO${NC} ] Starting renew cert... "
sleep 2
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc
echo -e "[ ${green}INFO${NC} ] Renew cert done... "
sleep 2
echo -e "[ ${green}INFO${NC} ] Starting service $Cek "
sleep 2
echo $domain > /etc/xray/domain
systemctl restart xray
systemctl restart nginx
echo -e "[ ${green}INFO${NC} ] All finished... "
sleep 0.5
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
}
# Date
DATE=$(date +'%d %B %Y')
datediff() {
d1=$(date -d "$1" +%s)
d2=$(date -d "$2" +%s)
# Get system uptime
uptime_info=$(uptime -p | sed 's/up //')
}
mai="datediff "$Exp" "$DATE""
export sem=$( curl -s https://raw.githubusercontent.com/riswandii-lop/jesstunnel/main/version)
export pak=$( cat /home/.ver)
IPVPS=$(curl -s ipinfo.io/ip )
clear
echo -e "$(figlet   "")" | lolcat
clear
# Define color variables
BIWhite="\033[1;37m"
BIYellow="\033[1;33m"
BIRed="\033[1;31m"
NC="\033[0m" # Reset color
LIGHTGREEN="\033[1;32m"

echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${BIYellow} \e[41;97;1m        ◥꧁Auto Script by Jestunnel꧂◤            \033[0m\e[38;5;196m${NC}"
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN} ⇲  ${LIGHTGREEN}VERSI OS  ➤ ${LIGHTGREEN}$(cat /etc/os-release | grep -w PRETTY_NAME | sed 's/PRETTY_NAME=//g' | sed 's/"//g')     ${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}UPTIME    ➤ ${LIGHTGREEN}$(uptime -p | sed 's/up //')    ${NC}"  
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}DOMAIN    ➤ ${LIGHTGREEN}$(cat /etc/xray/domain)    ${NC}"                              
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}RAM & CPU ➤ ${LIGHTGREEN}$totalram MB / $cpu_usage    ${NC}"                           
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}SWAP RAM  ➤ ${LIGHTGREEN}$uram / $tram MB    ${NC}"                                      
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}IP VPS    ➤ ${LIGHTGREEN}$IPVPS    ${NC}"    
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}VPS TIME  ➤ ${LIGHTGREEN}$(date +"%Y-%m-%d %H:%M:%S")    ${NC}"     
echo -e "\033[1m${LIGHTGREEN}┃${LIGHTGREEN} ⇲  ${LIGHTGREEN}ISP       ➤ ${LIGHTGREEN}$ISP    ${NC}" 
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${BIRed} ${LIGHTGREEN}     SSH : $ssh1  VMESS : $vma  VLESS : $vla  TROJAN : $tra $NC"
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN}  ${LIGHTGREEN}  SSH ${NC}: $ressh"" ${LIGHTGREEN} NGINX ${NC}: $resngx"" ${LIGHTGREEN}  XRAY ${NC}: $resv2r"" ${LIGHTGREEN} TROJAN ${NC}: $resv2r"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN}   ${LIGHTGREEN}   STUNNEL ${NC}: $resst" "${LIGHTGREEN} DROPBEAR ${NC}: $resdbr" "${LIGHTGREEN} SSH-WS ${NC}: $ressshws" 
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${BIRed}                 ${LIGHTGREEN}🔹 MENU OPTIONS 🔹${NC}                 ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [01] ${LIGHTGREEN}SSH     ${LIGHTGREEN}[Menu]      [08] ${LIGHTGREEN}ADD-HOST    ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [02] ${LIGHTGREEN}VMESS   ${LIGHTGREEN}[Menu]      [09] ${LIGHTGREEN}RUNNING     ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [03] ${LIGHTGREEN}VLESS   ${LIGHTGREEN}[Menu]      [10] ${LIGHTGREEN}INSTALL UDP ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [04] ${LIGHTGREEN}TROJAN  ${LIGHTGREEN}[Menu]      [11] ${LIGHTGREEN}INSTALL BOT ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [05] ${LIGHTGREEN}SETTINGS${LIGHTGREEN}[Menu]      [12] ${LIGHTGREEN}BANDWIDTH   ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [06] ${LIGHTGREEN}TRIAL   ${LIGHTGREEN}[Menu]      [13] ${LIGHTGREEN}MENU THEME  ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${LIGHTGREEN}  [07] ${LIGHTGREEN}BACKUP  ${LIGHTGREEN}[Menu]      [14] ${LIGHTGREEN}UPDATE      ${LIGHTGREEN}[Menu]${NC}  ${LIGHTGREEN}┃\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN}↪️ Script Versi   ➤ ${LIGHTGREEN}$(cat /opt/.ver)   ${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN}🧒 Nama Clinte    ➤ ${LIGHTGREEN}$Name    ${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN}🗓️ Expiry Date    ➤ ${LIGHTGREEN}$exp ${LIGHTGREEN}➤${LIGHTGREEN} $exp2${LIGHTGREEN} Days.   ${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC}${LIGHTGREEN}👤 Whastapp Owner ➤ ${LIGHTGREEN}085888801241     ${NC}"
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮\033[0m${NC}"
echo -e "\033[1m${LIGHTGREEN}┃${NC} ${BIRed} ${LIGHTGREEN}TERIMAKASIH SUDAH MENGGUNAKAN SCRIPT RISWAN JABAR${NC}  ${LIGHTGREEN}┃\033[0m${NC}"          
echo -e "\033[1m${LIGHTGREEN}╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯\033[0m${NC}"
echo -e ""
read -p "               Pilih Nomor └╼>>>  bro: " opt
echo -e ""
case $opt in
1) clear ; menu-ssh ;;
2) clear ; menu-vmess ;;
3) clear ; menu-vless ;;
4) clear ; menu-trojan ;;
5) clear ; menu-set ;;
6) clear ; menu-trial ;;
7) clear ; menu-backup ;;
8) clear ; add-host ;;
9) clear ; running ;;
10) clear ; wget https://raw.githubusercontent.com/gemilangvip/autoscript/main/files/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh ;;
11) clear ; menu-bot ;;
12) clear ; bw ;;
13) clear ; menu-theme ;;
14) clear ; update ;;
0) clear ; menu ;;
x) exit ;;
*) echo -e "" ; echo "Press any key to back exit" ; sleep 1 ; exit ;;
esac
