#!/bin/bash
#JULAK BANTUR
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
# Link Hosting Kalian

apt install rclone -y
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/julakhss/julakhss/main/JB2/rclone.conf"
#Install Wondershaper
cd /bin
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
sudo make install
cd
rm -rf wondershaper
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user backupsmtp93@gmail.com
from backupsmtp93@gmail.com
password sdallofkbpuhbtoa 
logfile ~/.msmtp.log
EOF
chown -R www-data:www-data /etc/msmtprc
cd /usr/bin
#wget -O autobackup "https://raw.githubusercontent.com/julakhss/julakhss/main/JB2/autobackup.sh"
wget -O bokep "https://raw.githubusercontent.com/julakhss/julakhss/main/JB2/backup.sh"
wget -O reskep "https://raw.githubusercontent.com/julakhss/julakhss/main/JB2/restore.sh"
#wget -O strt "https://raw.githubusercontent.com/julakhss/julakhss/main/JB2/strt.sh"
#wget -O limitspeed "https://raw.githubusercontent.com/julakhss/julakhss/main/JB2/limitspeed.sh"
#wget -O xp "https://raw.githubusercontent.com/bagusid93/sc3/main/ssh/xp.sh"

#chmod +x autobackup
chmod +x bokep
chmod +x reskep
#chmod +x strt
#chmod +x limitspeed
#chmod +x xp
cd
echo ""
