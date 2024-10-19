#!/bin/bash

# Check if the script is run as root
if [ "${EUID}" -ne 0 ]; then
  echo "You need to run this script as root"
  exit 1
fi

# Check if running on OpenVZ, which is not supported
if [ "$(systemd-detect-virt)" == "openvz" ]; then
  echo "OpenVZ is not supported"
  exit 1
fi

# Clear the screen and initialize variables
clear
version=$(cat /home/ver)
ver=$(curl -s https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/version)
line=$(cat /etc/line)
below=$(cat /etc/below)
back_text=$(cat /etc/back)
number=$(cat /etc/number)
box=$(cat /etc/box)

# Color formatting
Green_font_prefix="\033[32m"
Red_font_prefix="\033[31m"
Font_color_suffix="\033[0m"

Info1="${Green_font_prefix}($version)${Font_color_suffix}"
Info2="${Green_font_prefix}(OLD VERSION)${Font_color_suffix}"
Error="Version ${Green_font_prefix}[$ver]${Font_color_suffix} available ${Red_font_prefix}[Please Update]${Font_color_suffix}"

# Check for version status
new_version=$(curl -s https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/version)
if [ "$version" == "$new_version" ]; then
  sts="${Info2}"
else
  sts="${Error}"
fi

# Display update information
echo ""
figlet 'UPDATE' | lolcat
echo -e "   \e[$line--------------------------------------------------------\e[m"
echo -e "   \e[$back_text                 \e[30m[\e[$box CCHECK NEW UPDATE\e[30m ]                   \e[m"
echo -e "   \e[$line--------------------------------------------------------\e[m"
echo -e "   \e[$below VVERSION NOW >> $Info1"
echo -e "   \e[$below SSTATUS UPDATE >> $sts"
echo -e ""
echo -e "       \e[1;31mWould you like to proceed?\e[0m"
echo ""
echo -e "       \e[0;32m[ Select Option ]\033[0m"
echo -e "      \e[$number [ 1 ]\e[m \e[$below CCheck Script Update Now\e[m"
echo -e "      \e[$number [ x ]\e[m \e[$below BBack To Menu\e[m"
echo -e ""
echo -e "   \e[$line--------------------------------------------------------\e[m"
echo -e "\e[$line"
read -p "Please Choose 1 or x : " option2

case $option2 in
1)
  # Check for new version again
  new_version=$(curl -s https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/version)
  if [ "$version" == "$new_version" ]; then
    clear
    echo ""
    echo -e "\e[1;31mChecking New Version, Please Wait...!\e[m"
    sleep 3
    clear
    echo -e "\e[1;31mUpdate Not Available\e[m"
    sleep 2
    echo -e "\e[1;36mYou Have The Latest Version\e[m"
    echo -e "\e[1;31mThank you.\e[0m"
    exit 0
  fi

  # Update process
  clear
  echo -e "\e[1;31mUpdate Available Now..\e[m"
  echo -e ""
  sleep 2
  echo -e "\e[1;36mStart Update For New Version, Please Wait..\e[m"
  sleep 2
  clear
  echo -e "\e[0;32mGetting New Version Script..\e[0m"
  sleep 1

  # Change to /usr/bin directory
  cd /usr/bin || exit

  # List of files to download
  files=(
    "usernew" "auto-reboot" "restart" "tendang" "clearcache" "running" "speedtest"
    "menu-vless" "menu-vmess" "menu-trojan" "menu-ssh" "menu-backup" "menu"
    "menu1" "menu2" "menu3" "menu4" "menu5" "menu-webmin" "xp" "update"
    "add-host" "certv2ray" "menu-set" "about" "trial" "add-tr" "del-tr"
    "cek-tr" "trialtrojan" "renew-tr" "add-ws" "del-ws" "cek-ws" "renew-ws"
    "trialvmess" "add-vless" "del-vless" "cek-vless" "renew-vless" "trialvless"
    "menu-trial" "menu-theme"
  )

  # Download files and set permissions
  for file in "${files[@]}"; do
    wget -q -O "$file" "https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/${file}.sh" && chmod +x "$file"
  done

  clear
  echo -e ""
  echo -e "\e[0;32mDownloaded successfully!\e[0m"
  sleep 1
  echo -e "\e[0;32mPatching New Update, Please Wait...\e[0m"
  sleep 2
  echo -e "\e[0;32mPatching... OK!\e[0m"
  sleep 1
  echo -e "\e[0;32mSuccess Update Script For New Version\e[0m"
  echo "$ver" > /home/ver
  clear
  echo ""
  echo -e "\033[0;34m----------------------------------------\033[0m"
  echo -e "\E[44;1;39m            SCRIPT UPDATED              \E[0m"
  echo -e "\033[0;34m----------------------------------------\033[0m"
  read -n 1 -s -r -p "Press any key to back to menu"
  menu
  ;;
x)
  clear
  read -n 1 -s -r -p "Press any key to back to menu"
  menu
  ;;
*)
  echo -e "\e[1;31mInvalid option. Please try again.\e[0m"
  ;;
esac
