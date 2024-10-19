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

echo ""

# Fetch the current and latest version
version=$(cat /home/ver)
new_version=$(curl -s https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/version)

if [ "$version" == "$new_version" ]; then
  status="${Green_font_prefix}(OLD VERSION)${Font_color_suffix}"
else
  status="${Red_font_prefix}[Please Update to Version $new_version]${Font_color_suffix}"
fi

clear
echo "Current version: $version"
echo "Status: $status"

# Begin update process
echo -e "\e[0;32mPlease Wait...!\e[0m"
sleep 1
clear
echo -e "\e[0;32mDownloading new version scripts...\e[0m"

# Download scripts with error handling
cd /usr/bin || exit

files=(
  "usernew" "auto-reboot" "restart" "tendang" "clearcache" "running" "speedtest"
  "menu-vless" "menu-vmess" "menu-trojan" "menu-ssh" "menu-backup" "menu" 
  "menu1" "menu2" "menu3" "menu4" "menu5" "menu-webmin" "xp" "update" 
  "add-host" "certv2ray" "menu-set" "about" "trial" "add-tr" "del-tr" 
  "cek-tr" "trialtrojan" "renew-tr" "add-ws" "del-ws" "cek-ws" "renew-ws" 
  "trialvmess" "add-vless" "del-vless" "cek-vless" "renew-vless" "trialvless"
  "menu-trial" "menu-theme"
)

for file in "${files[@]}"; do
  wget -q -O "/usr/bin/$file" "https://raw.githubusercontent.com/Lite-VPN/premiumsc/main/${file}.sh" && chmod +x "/usr/bin/$file"
  if [ $? -ne 0 ]; then
    echo -e "\e[0;31mFailed to download or set permissions for $file\e[0m"
  fi
done

clear
echo -e "\e[0;32mScripts updated successfully....!!!\e[0m"

# Update version
echo "$new_version" > /home/ver

# Cleanup
rm -f update.sh
clear
echo ""
read -n 1 -s -r -p "Press any key to return to the menu"
menu
