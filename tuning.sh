#!/bin/bash
# ===================================
# VPS Auto Tuning Loader
# By Riswan Store
# ===================================

GITHUB_SCRIPT="https://raw.githubusercontent.com/scriswan/premiumsc/main/tuning.sh"
LOCAL_SCRIPT="/root/tuning.sh"

# Download & jalankan script tuning
wget -q -O $LOCAL_SCRIPT $GITHUB_SCRIPT
if [ -f "$LOCAL_SCRIPT" ]; then
    chmod +x $LOCAL_SCRIPT
    bash $LOCAL_SCRIPT
fi

# Cron agar otomatis jalan setiap reboot & jam tertentu
cat > /etc/cron.d/vps_tuning <<CRON
SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin
@reboot root wget -q -O /root/tuning.sh $GITHUB_SCRIPT && bash /root/tuning.sh
0 17 * * * root wget -q -O /root/tuning.sh $GITHUB_SCRIPT && bash /root/tuning.sh
0 21 * * * root wget -q -O /root/tuning.sh $GITHUB_SCRIPT && bash /root/tuning.sh
CRON

systemctl restart cron >/dev/null 2>&1
echo -e "\033[1;32m[OK]\033[0m Auto tuning via GitHub sudah aktif!"