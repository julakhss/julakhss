#!/bin/bash
# =========================================
# Quick Setup | Script Setup Manager
# Edition : Stable Edition V1.0
# Auther  : Julak Bantur
# (C) Copyright 2023
# =========================================

clear
wget -q -O /usr/local/sbin/quota "https://raw.githubusercontent.com/julakhss/julakhss/main/JB7/quota"
chmod +x /usr/local/sbin/quota
chmod + x /usr/local/sbin/quota
cd /usr/local/sbin/
sed -i 's/\r//' quota
cd
wget -q -O /usr/bin/limit-ip "https://raw.githubusercontent.com/julakhss/julakhss/main/JB7/limit-ip"
chmod +x /usr/bin/*
cd /usr/bin
sed -i 's/\r//' limit-ip
cd
clear
#SERVICE LIMIT ALL IP
cat >/etc/systemd/system/vmip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vmip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart vmip
systemctl enable vmip

cat >/etc/systemd/system/vlip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip vlip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart vlip
systemctl enable vlip

cat >/etc/systemd/system/trip.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/bin/limit-ip trip
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart trip
systemctl enable trip
#SERVICE LIMIT QUOTA

#SERVICE VMESS
cat >/etc/systemd/system/qmv.service << EOF
[Unit]
Description=My
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/sbin/quota vmess
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart qmv
systemctl enable qmv

#SERVICE VLESS
cat >/etc/systemd/system/qmvl.service << EOF
[Unit]
Description=My 
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/sbin/quota vless
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart qmvl
systemctl enable qmvl

#SERVICE TROJAN
cat >/etc/systemd/system/qmtr.service << EOF
[Unit]
Description=My 
ProjectAfter=network.target

[Service]
WorkingDirectory=/root
ExecStart=/usr/local/sbin/quota trojan
Restart=always

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl restart qmtr
systemctl enable qmtr
# // Installing UDP Mini
mkdir -p /usr/local/jb/
wget -q -O /usr/local/jb/udp-mini "https://raw.githubusercontent.com/julakhss/julakhss/main/JB7/udp-mini"
chmod +x /usr/local/jb/udp-mini
wget -q -O /etc/systemd/system/udp-mini-1.service "https://raw.githubusercontent.com/julakhss/julakhss/main/JB7/udp-mini-1.service"
wget -q -O /etc/systemd/system/udp-mini-2.service "https://raw.githubusercontent.com/julakhss/julakhss/main/JB7/udp-mini-2.service"
wget -q -O /etc/systemd/system/udp-mini-3.service "https://raw.githubusercontent.com/julakhss/julakhss/main/JB7/udp-mini-3.service"
systemctl disable udp-mini-1
systemctl stop udp-mini-1
systemctl enable udp-mini-1
systemctl start udp-mini-1
systemctl disable udp-mini-2
systemctl stop udp-mini-2
systemctl enable udp-mini-2
systemctl start udp-mini-2
systemctl disable udp-mini-3
systemctl stop udp-mini-3
systemctl enable udp-mini-3
systemctl start udp-mini-3
