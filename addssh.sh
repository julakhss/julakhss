#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########


clear
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
domen=`cat /etc/xray/domain`
else
domen=`cat /etc/v2ray/domain`
fi
#nameserver=`cat /root/nsdomain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
#nameserver1=`cat /etc/slowdns/infons`
#slkey1=`cat /root/server.pub`
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
author=$(cat /etc/profil)


echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
read -p "Username : " user

CLIENT_EXISTS=$(grep -w $user /etc/ssh/.ssh.db | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
    echo ""
    echo -e "$COLOR1 Username Sudah Terdaftar, Silahkan Buat Dengan Username Lain ${NC}"
    echo ""
    echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu-ssh
  fi
sec=3
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
    echo -ne "\e[33m ${spinner[sec]} Setting up a Premium Account $sec seconds...\r"
    sleep 1
    sec=$(($sec - 1))
done
clear 
echo -e "\e[1;32mINPUT DEPENDECIES ACCOUNT $user\e[0m\n"
until [[ $PASSWD =~ ^[a-zA-Z0-9]+$ ]]; do
read -p "Password : " Pass
done
until [[ $EXPIRED =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " masaaktif
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"

OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
sleep 1
clear
clear
clear
clear
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $user &> /dev/null
echo -e "### $user $expi $Pass $iplim" >> /etc/ssh/.ssh.db
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`
if [[ ${c} != "0" ]]; then
  echo "${iplim}" >/etc/ssh/${user}
fi
DATADB=$(cat /etc/ssh/.ssh.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/ssh/.ssh.db
fi

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Premium Account   </code>
<code>──────────────────</code>
<code>Username         : </code> <code>$user</code>
<code>Password         : </code> <code>$Pass</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Limit IP             : </code> <code>$batas (Login)</code>
<code>Host Slowdns     : </code> <code>$sldomain</code>
<code>Pub Key          : </code> <code> $slkey</code>
<code>Port OpenSSH     : </code> <code>22</code>
<code>Port Dropbear    : </code> <code>109,110,143</code>
<code>Port DNS         : </code> <code>80, 443,53</code> 
<code>Port SSH WS      : </code> <code>80</code>
<code>Port SSH SSL WS  : </code> <code>443,444</code>
<code>Port SSL/TLS     : </code> <code>447,8443</code>
<code>Port OVPN WS SSL : </code> <code>2086</code>
<code>Port OVPN SSL    : </code> <code>990</code>
<code>Port OVPN TCP    : </code> <code>$ovpn</code>
<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
<code>Proxy Squid      : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP          :</code> <code>$domen:1-65535@$Login:$Pass</code>
<code>───────────────────</code>
<code>Payload WS       : </code> <code>GET ws://$domen/ [protocol][crlf]Host: isi_bug_disini[crlf]Upgrade: websocket[crlf][crlf]</code>
<code>───────────────────</code>
<code>OpenVPN SSL      : </code> https://$domen:81/ssl.ovpn
<code>OpenVPN TCP      : </code> https://$domen:81/tcp.ovpn
<code>OpenVPN UDP      : </code> https://$domen:81/udp.ovpn
<code>───────────────────</code>
<code>           $author                       </code>
<code>───────────────────</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null

if [[ ! -z "${PID}" ]]; then

clear
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$user"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Limit IP         ${COLOR1}: ${WH}$batas (Login)" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}22" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}109,110,143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}443,444" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447,8443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}$ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}PORT SLWDNS     ${COLOR1}: ${WH}80,443,53" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}NAMESERVER      ${COLOR1}: ${WH}$sldomain" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC ${WH}PUB KEY         ${COLOR1}: ${WH}$slkey" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}SSH UDP   :                                      ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}$domen:1-65535@$user:$Pass ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}Payload WS :                  ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}GET ws://$domen/ [protocol][crlf]Host: Isi_Bug_Disini[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}  ${WH}• $author •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-createssh-${user}.log
else

echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}${COLBG1}    ${WH}• Ssh Ovpn Account •           ${NC} $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Username   ${COLOR1}: ${WH}$user"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Password   ${COLOR1}: ${WH}$Pass" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Expired On ${COLOR1}: ${WH}$exp"  | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}IP               ${COLOR1}: ${WH}$IP" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Host             ${COLOR1}: ${WH}$domen" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Limit IP         ${COLOR1}: ${WH}$batas (Login)" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC ${WH}Wildcard   ${COLOR1}: ${WH}(bug.com).$domen" | tee -a /etc/log-create-user.log
echo -e "$COLOR1 $NC ${WH}OpenSSH          ${COLOR1}: ${WH}22" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Dropbear         ${COLOR1}: ${WH}109,110,143" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH UDP     ${COLOR1}: ${WH}1-65535" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS      ${COLOR1}: ${WH}80" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH WS/SSL  ${COLOR1}: ${WH}443,444" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port SSH SSL/TLS ${COLOR1}: ${WH}447,8443" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn TCP    ${COLOR1}: ${WH}$ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn UDP    ${COLOR1}: ${WH}$ovpn2" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}Port Ovpn SSL    ${COLOR1}: ${WH}990" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OVPN TCP         ${COLOR1}: ${WH}http://$domen:81/tcp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OVPN UDP         ${COLOR1}: ${WH}http://$domen:81/udp.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}OVPN SSL         ${COLOR1}: ${WH}http://$domen:81/ssl.ovpn" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}UDPGW            ${COLOR1}: ${WH}7100-7900" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}PORT SLWDNS     ${COLOR1}: ${WH}80,443,53" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 $NC ${WH}NAMESERVER      ${COLOR1}: ${WH}$sldomain" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver"
echo -e "$COLOR1 $NC ${WH}PUB KEY         ${COLOR1}: ${WH}$slkey" | tee -a /etc/xray/log-createssh-${user}.log
#echo -e "$COLOR1 $NC  ${WH}NAMESERVER ${COLOR1}: ${WH}$nameserver1"
#echo -e "$COLOR1 $NC  ${WH}PUB KEY    ${COLOR1}: ${WH}$slkey1"
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}SSH UDP   :                                      ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}$domen:1-65535@$user:$Pass ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}Payload WS :                  ${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1${NC}${WH}GET ws://$domen/ [protocol][crlf]Host: Isi_Bug_Disini[crlf]Upgrade: websocket[crlf][crlf]${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1─────────────────${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1┌────────────────────┐${NC}" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1 ${NC}  ${WH}• $author •${NC}    $COLOR1 $NC" | tee -a /etc/xray/log-createssh-${user}.log
echo -e "$COLOR1└────────────────────┘${NC}" | tee -a /etc/xray/log-createssh-${user}.log
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
