#!/bin/bash
# ===================================
# VPS Auto Tuning (Riswan Store)
# ===================================

echo -e "\033[1;32m[INFO]\033[0m Jalankan tuning VPS..."

# Limits
cat > /etc/security/limits.conf <<EOF
* soft nofile 65535
* hard nofile 65535
root soft nofile 65535
root hard nofile 65535
EOF

# Systemd Limits
cat > /etc/systemd/system.conf <<EOF
[Manager]
DefaultLimitNOFILE=65535
DefaultLimitNPROC=65535
DefaultTasksMax=65535
EOF

cat > /etc/systemd/user.conf <<EOF
[Manager]
DefaultLimitNOFILE=65535
DefaultLimitNPROC=65535
DefaultTasksMax=65535
EOF

# Kernel sysctl tuning
cat > /etc/sysctl.d/99-tuning.conf <<EOF
net.core.rmem_max=26214400
net.core.wmem_max=26214400
net.core.somaxconn=65535
net.ipv4.tcp_fin_timeout=15
net.ipv4.tcp_tw_reuse=1
net.ipv4.tcp_window_scaling=1
net.ipv4.ip_local_port_range=1024 65535
net.ipv4.tcp_max_syn_backlog=65535
net.ipv4.tcp_max_tw_buckets=2000000
net.ipv4.tcp_rmem=4096 87380 16777216
net.ipv4.tcp_wmem=4096 65536 16777216
net.ipv4.tcp_congestion_control=bbr
net.ipv4.tcp_mtu_probing=1
EOF

# Terapkan sysctl
sysctl --system

# Restart systemd biar limit aktif
systemctl daemon-reexec

# Restart service penting
systemctl restart ssh
systemctl restart xray 2>/dev/null

echo -e "\033[1;32m[OK]\033[0m VPS tuning selesai!"
ulimit -n