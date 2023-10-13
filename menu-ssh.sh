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
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/bagusid93/hss/main/sc3"
checking_sc() {
useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
if [[ $date_list < $useexp ]]; then
echo -ne
else
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e "\033[42m          JULAK BANTUR AUTOSCRIPT          \033[0m"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
echo -e ""
echo -e "            ${RED}AKSES DITOLAK !${NC}"
echo -e "   \033[0;33mIPVPS KAMU${NC} $MYIP \033[0;33mTidak Terdaftar${NC}"
echo -e "   \033[0;33mHubungi Admin Untuk Buy AutoScript${NC}"
echo -e "           ${RED}KONTAK ADMIN !${NC}"
echo -e "   \033[0;36mTelegram${NC}: https://t.me/Cibut2d"
echo -e "   \033[0;36mWhatsApp${NC}: https://wa.me/6281250851741"
echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
exit
fi
}
checking_sc
clear
if [[ -e /etc/xray/ssh ]]; then
echo -ne
else
touch /etc/xray/ssh
fi

function usernew(){
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
}
function trial(){
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

clear
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

Login=trial`</dev/urandom tr -dc X-Z0-9 | head -c4`
hari="1"
Pass=1
echo Ping Host
echo Create Akun: $user
sleep 0.5
echo Setting Password: $Pass
sleep 0.5
clear
clear
clear
clear
expi=`date -d "$masaaktif days" +"%Y-%m-%d"`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $user
exp="$(chage -l $user | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $user &> /dev/null
echo -e "### $user $expi $Pass" >> /etc/ssh/.ssh.db
PID=`ps -ef |grep -v grep | grep sshws |awk '{print $2}'`

TEXT="
<code>──────────────────</code>
<code>    SSH OVPN Premium Account   </code>
<code>──────────────────</code>
<code>Username        : </code> <code>$user</code>
<code>Password        : </code> <code>$Pass</code>
<code>Expired          : </code> <code>$exp</code>
<code>──────────────────</code>
<code>IP               : </code> <code>$IP</code>
<code>Host             : </code> <code>$domen</code>
<code>Host Slowdns    : </code> <code>$sldomain</code>
<code>Pub Key          : </code> <code> $slkey</code>
<code>Port OpenSSH    : </code> <code>22</code>
<code>Port Dropbear    : </code> <code>109,110,143</code>
<code>Port DNS         : </code> <code>80, 443,53</code> 
<code>Port SSH WS     : </code> <code>80</code>
<code>Port SSH SSL WS : </code> <code>443,444</code>
<code>Port SSL/TLS     : </code> <code>447, 8443</code>
<code>Port OVPN WS SSL : </code> <code>2086</code>
<code>Port OVPN SSL    : </code> <code>990</code>
<code>Port OVPN TCP    : </code> <code>$ovpn</code>
<code>Port OVPN UDP    : </code> <code>$ovpn2</code>
<code>Proxy Squid        : </code> <code>3128</code>
<code>BadVPN UDP       : </code> <code>7100, 7300, 7300</code>
<code>───────────────────</code>
<code>SSH UDP      :</code> <code>$domen:1-65535@$Login:$Pass</code>
<code>Payload WS   : </code> <code>GET / HTTP/1.1[crlf]Host: $domen[crlf]Upgrade: websocket[crlf][crlf]</code>
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
fi
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function renew(){
clear
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• RENEW USERS •                ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
echo -e "$COLOR1  Yahhh , Tidak Ada Username Yang Terdaftar${NC}"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• RENEW USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""	
echo -e " $COLOR Pilih Nomer User Yang Akan Di Renew ${NC}"
echo -e " $COLOR Tekan CTRL+C Untuk Membatalkan ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select Number [1]: " CLIENT_NUMBER
else
read -rp "Select Number [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
fi
done
User=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
Days=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)

egrep "^$User" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
read -p "Day Extend : " Days
Today=`date +%s`
Days_Detailed=$(( $Days * 86400 ))
Expire_On=$(($Today + $Days_Detailed))
Expiration=$(date -u --date="1970-01-01 $Expire_On sec GMT" +%Y/%m/%d)
Expiration_Display=$(date -u --date="1970-01-01 $Expire_On sec GMT" '+%d %b %Y')
passwd -u $User
usermod -e  $Expiration $User
egrep "^$User" /etc/passwd >/dev/null
echo -e "$Pass\n$Pass\n"|passwd $User &> /dev/null
clear
TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  SSHWS OVPN RENEW</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>DOMAIN   :</b> <code>${domain} </code>
<b>USERNAME :</b> <code>$User </code>
<b>EXPIRED  :</b> <code>$Expiration_Display </code>
<code>◇━━━━━━━━━━━━━━◇</code>
"

curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null


echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• RENEW USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e ""
echo -e " Username   : $User"
echo -e " Days Added : $Days Days"
echo -e " Expires on : $Expiration_Display"
echo -e ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function hapus(){
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/ssh/.ssh.db")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
echo -e " $COLOR Yahhh, Tidak Ada Username Yang Terdaftar ${NC}"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""	
echo -e " $COLOR Pilih Nomer User Yang Akan Di Hapus ${NC}"
echo -e " $COLOR Tekan CTRL×C Untuk Membatalkan ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select Number [1]: " CLIENT_NUMBER
else
read -rp "Select Number [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
fi
done
Pengguna=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
Days=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
sed -i "/^### $Pengguna $Days/d" /etc/xray/ssh
if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function cekconfig(){
portsshws=`cat ~/log-install.txt | grep -w "SSH Websocket" | cut -d: -f2 | awk '{print $1}'`
wsssl=`cat /root/log-install.txt | grep -w "SSH SSL Websocket" | cut -d: -f2 | awk '{print $1}'`
author=$(cat /etc/profil)
IP=$(curl -sS ifconfig.me);
ossl=`cat /root/log-install.txt | grep -w "OpenVPN" | cut -f2 -d: | awk '{print $6}'`
opensh=`cat /root/log-install.txt | grep -w "OpenSSH" | cut -f2 -d: | awk '{print $1}'`
db=`cat /root/log-install.txt | grep -w "Dropbear" | cut -f2 -d: | awk '{print $1,$2}'`
ssl="$(cat ~/log-install.txt | grep -w "Stunnel4" | cut -d: -f2)"
sqd="$(cat ~/log-install.txt | grep -w "Squid" | cut -d: -f2)"
ovpn="$(netstat -nlpt | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
ovpn2="$(netstat -nlpu | grep -i openvpn | grep -i 0.0.0.0 | awk '{print $4}' | cut -d: -f2)"
domen=`cat /etc/v2ray/domain`
sldomain=`cat /etc/xray/dns`
slkey=`cat /etc/slowdns/server.pub`
OhpSSH=`cat /root/log-install.txt | grep -w "OHP SSH" | cut -d: -f2 | awk '{print $1}'`
OhpDB=`cat /root/log-install.txt | grep -w "OHP DBear" | cut -d: -f2 | awk '{print $1}'`
OhpOVPN=`cat /root/log-install.txt | grep -w "OHP OpenVPN" | cut -d: -f2 | awk '{print $1}'`
NUMBER_OF_CLIENTS=$(grep -c -E "^### " "/etc/xray/ssh")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• SELECT USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
echo -e " $COLOR Yahhh, Tidak Ada Username Yang Terdaftar ${NC}"
echo ""
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
fi
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• SELECT USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""	
echo -e " $COLOR Pilih Nomer User Yang Ingin Di Cek ${NC}"
echo -e " $COLOR Tekan CTRL+C Untuk Membatalkan ${NC}"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2-3 | nl -s ') '
until [[ ${CLIENT_NUMBER} -ge 1 && ${CLIENT_NUMBER} -le ${NUMBER_OF_CLIENTS} ]]; do
if [[ ${CLIENT_NUMBER} == '1' ]]; then
read -rp "Select Number [1]: " CLIENT_NUMBER
else
read -rp "Select Number [1-${NUMBER_OF_CLIENTS}]: " CLIENT_NUMBER
fi
done
user=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 2 | sed -n "${CLIENT_NUMBER}"p)
exp=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 3 | sed -n "${CLIENT_NUMBER}"p)
Pass=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 4 | sed -n "${CLIENT_NUMBER}"p)
iplim=$(grep -E "^### " "/etc/ssh/.ssh.db" | cut -d ' ' -f 5 | sed -n "${CLIENT_NUMBER}"p)

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
read -n 1 -s -r -p "   Press any key to back on menu"
menu-ssh
}
function hapuslama(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}                 ${WH}• MEMBER SSH •                ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC} ${COLBG1}              ${WH}• DELETE USERS •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo ""
read -p "Username SSH to Delete 👉 " Pengguna

if getent passwd $Pengguna > /dev/null 2>&1; then
        userdel $Pengguna > /dev/null 2>&1
        echo -e "User $Pengguna was removed."
else
        echo -e "Failure: User $Pengguna Not Exist."
fi
sed -i "/^### $Pengguna/d" /etc/ssh/.ssh.db
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function login(){
clear
echo " "
echo " "
author=$(cat /etc/profil)

if [ -e "/var/log/auth.log" ]; then
        LOG="/var/log/auth.log";
fi
if [ -e "/var/log/secure" ]; then
        LOG="/var/log/secure";
fi
               
data=( `ps aux | grep -i dropbear | awk '{print $2}'`);
echo -e "$COLOR1┌──────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}${COLBG1}         ${WH}SSH User Login           ${NC} $COLOR1 $NC"
echo -e "$COLOR1└──────────────────────────────────┘${NC}"
echo "ID  |  Username  |  IP Address";
echo -e "$COLOR1┌──────────────────────────────────┐${NC}"
cat $LOG | grep -i dropbear | grep -i "Password auth succeeded" > /tmp/login-db.txt;
for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "dropbear\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $10}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $12}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi

done
echo " "
cat $LOG | grep -i sshd | grep -i "Accepted password for" > /tmp/login-db.txt
data=( `ps aux | grep "\[priv\]" | sort -k 72 | awk '{print $2}'`);

for PID in "${data[@]}"
do
        cat /tmp/login-db.txt | grep "sshd\[$PID\]" > /tmp/login-db-pid.txt;
        NUM=`cat /tmp/login-db-pid.txt | wc -l`;
        USER=`cat /tmp/login-db-pid.txt | awk '{print $9}'`;
        IP=`cat /tmp/login-db-pid.txt | awk '{print $11}'`;
        if [ $NUM -eq 1 ]; then
                echo "$PID - $USER - $IP";
        fi

done
if [ -f "/etc/openvpn/server/openvpn-tcp.log" ]; then
        echo " "
        cat /etc/openvpn/server/openvpn-tcp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-tcp.txt
        cat /tmp/vpn-login-tcp.txt
fi

if [ -f "/etc/openvpn/server/openvpn-udp.log" ]; then
        echo " "
        cat /etc/openvpn/server/openvpn-udp.log | grep -w "^CLIENT_LIST" | cut -d ',' -f 2,3,8 | sed -e 's/,/      /g' > /tmp/vpn-login-udp.txt
        cat /tmp/vpn-login-udp.txt
fi
echo -e "$COLOR1└──────────────────────────────────┘${NC}"
echo ""
echo -e "$COLOR1┌──────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC}${COLBG1}          ${WH}• $author •           ${NC}$COLOR1$NC"
echo -e "$COLOR1└──────────────────────────────────┘${NC}"
echo "";

rm -f /tmp/login-db-pid.txt
rm -f /tmp/login-db.txt
rm -f /tmp/vpn-login-tcp.txt
rm -f /tmp/vpn-login-udp.txt
read -n 1 -s -r -p "Press any key to back on menu"

menu-ssh
}


function member(){
clear
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1${NC}${COLBG1}                 ${WH}• MEMBER SSH •                 ${NC}$COLOR1$NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "USERNAME          EXP DATE          STATUS"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
while read expired
do
AKUN="$(echo $expired | cut -d: -f1)"
ID="$(echo $expired | grep -v nobody | cut -d: -f3)"
exp="$(chage -l $AKUN | grep "Account expires" | awk -F": " '{print $2}')"
status="$(passwd -S $AKUN | awk '{print $2}' )"
if [[ $ID -ge 1000 ]]; then
if [[ "$status" = "L" ]]; then
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "LOCKED"
else
printf "%-17s %2s %-17s %2s \n" "$AKUN" "$exp     " "UNLOCKED"
fi
fi
done < /etc/passwd
JUMLAH="$(awk -F: '$3 >= 1000 && $1 != "nobody" {print $1}' /etc/passwd | wc -l)"
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo "Account number: $JUMLAH user"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
read -n 1 -s -r -p "Press any key to back on menu"

menu-ssh
}
function delete(){
clear
$author
               hariini=`date +%d-%m-%Y`
               echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
               echo -e "$COLOR1${NC}${COLBG1}               ${WH}• Auto Delete •              ${NC}$COLOR1$NC"
               echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
               echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
               echo "                    Thank you for removing the EXPIRED USERS"
               echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
               cat /etc/shadow | cut -d: -f1,8 | sed /:$/d > /tmp/expirelist.txt
               totalaccounts=`cat /tmp/expirelist.txt | wc -l`
               for((i=1; i<=$totalaccounts; i++ ))
               do
               tuserval=`head -n $i /tmp/expirelist.txt | tail -n 1`
               username=`echo $tuserval | cut -f1 -d:`
               userexp=`echo $tuserval | cut -f2 -d:`
               userexpireinseconds=$(( $userexp * 86400 ))
               tglexp=`date -d @$userexpireinseconds`
               tgl=`echo $tglexp |awk -F" " '{print $3}'`
               while [ ${#tgl} -lt 2 ]
               do
               tgl="0"$tgl
               done
               while [ ${#username} -lt 15 ]
               do
               username=$username" "
               done
               bulantahun=`echo $tglexp |awk -F" " '{print $2,$6}'`
               echo "echo "Expired- User : $username Expire at : $tgl $bulantahun"" >> /usr/local/bin/alluser
               todaystime=`date +%s`
               if [ $userexpireinseconds -ge $todaystime ] ;
               then
		    	:
               else
               echo "echo "Expired- Username : $username are expired at: $tgl $bulantahun and removed : $hariini "" >> /usr/local/bin/deleteduser
	           echo "Username $username that are expired at $tgl $bulantahun removed from the VPS $hariini"
               userdel $username
               fi
               done
               echo " "
               echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
               echo -e "$COLOR1${NC}${COLBG1}              ${WH}• $author •              ${NC}$COLOR1$NC"
               echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"

               read -n 1 -s -r -p "Press any key to back on menu"
               menu-ssh
}
function autokill(){
Green_font_prefix="\033[32m" && Red_font_prefix="\033[31m" && Green_background_prefix="\033[42;37m" && Red_background_prefix="\033[41;37m" && Font_color_suffix="\033[0m"
Info="${Green_font_prefix}[ON]${Font_color_suffix}"
Error="${Red_font_prefix}[OFF]${Font_color_suffix}"
cek=$(grep -c -E "^### Autokill" /etc/cron.d/tendang)
if [[ "$cek" = "1" ]]; then
sts="${Info}"
else
sts="${Error}"
fi
clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1${NC}${COLBG1}             AUTOINFO LOGIN SSH          ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "Status Autokill : $sts        "
echo -e ""
echo -e "[1]  AutoInfo After 1 Minutes"
echo -e "[2]  AutoInfo After 5 Minutes"
echo -e "[3]  AutoInfo After 10 Minutes"
echo -e "[4]  Turn Off AutoKill/MultiLogin"
echo ""
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e ""
read -p "Select From Options [1-4 or x] :  " AutoKill
if [ -z $AutoKill ]; then
autokill-menu
fi
read -p "Multilogin Maximum Number Of Allowed: " max
echo -e ""
case $AutoKill in
                1)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "### Autokill" >/etc/cron.d/tendang
                echo "*/1 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoInfo Every     : 1 Minutes"
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                2)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "### Autokill" >/etc/cron.d/tendang
                echo "*/5 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoInfo Every     : 5 Minutes"
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                3)
                echo -e ""
                sleep 1
                clear
                echo > /etc/cron.d/tendang
                echo "### Autokill" >/etc/cron.d/tendang
                echo "*/10 * * * *  root /usr/bin/tendang $max" >>/etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      Allowed MultiLogin : $max"
                echo -e "      AutoInfo Every     : 10 Minutes"
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                4)
                clear
                rm /etc/cron.d/tendang
                echo -e ""
                echo -e "======================================"
                echo -e ""
                echo -e "      AutoInfo MultiLogin Turned Off  "
                echo -e ""
                echo -e "======================================"
                service cron restart >/dev/null 2>&1
                service cron reload >/dev/null 2>&1
                ;;
                x)
                clear
                autokill-menu
                ;;
        esac
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
function ceklim(){

clear
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}         CEK USER MULTI SSH     ${NC}$COLOR1$NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
if [ -e "/root/log-limit.txt" ]; then
echo "User Who Violate The Maximum Limit";
echo "Time - Username - Number of Multilogin"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
cat /root/log-limit.txt
else
echo " No user has committed a violation"
echo " "
echo " or"
echo " "
echo " The user-limit script not been executed."
fi
echo " ";
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu-ssh
}
clear
author=$(cat /etc/profil)
echo -e "$COLOR1┌─────────────────────────────────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}              ${WH}• SSH PANEL MENU •              ${NC} $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e " $COLOR1┌───────────────────────────────────────────────┐${NC}
 $COLOR1 $NC   ${WH}[${COLOR1}01${WH}]${NC} ${COLOR1}• ${WH}ADD SSH          ${WH}[${COLOR1}06${WH}]${NC} ${COLOR1}• ${WH}LOCK USER SSH ${NC}     $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}02${WH}]${NC} ${COLOR1}• ${WH}RENEW SSH        ${WH}[${COLOR1}07${WH}]${NC} ${COLOR1}• ${WH}UNLOCK USER SSH ${NC}$COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}03${WH}]${NC} ${COLOR1}• ${WH}DELETE SSH       ${WH}[${COLOR1}08${WH}]${NC} ${COLOR1}• ${WH}SET AUTOKILL ${NC}    $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}04${WH}]${NC} ${COLOR1}• ${WH}USER ONLINE      ${WH}[${COLOR1}09${WH}]${NC} ${COLOR1}• ${WH}TRIAL SSH ${NC} $COLOR1 $NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}05${WH}]${NC} ${COLOR1}• ${WH}MEMBER SSH$NC
 $COLOR1 $NC                                              ${NC} $COLOR1 $NC
 $COLOR1 $NC   ${WH}[${COLOR1}00${WH}]${NC} ${COLOR1}• ${WH}GO BACK${NC}                              $COLOR1 $NC"
echo -e " $COLOR1└───────────────────────────────────────────────┘${NC}"
echo -e "$COLOR1┌────────────────────── ${WH}BY${NC} ${COLOR1}───────────────────────┐${NC}"
echo -e "$COLOR1 ${NC} ${COLBG1}               ${WH}• $author •                 $COLOR1 $NC"
echo -e "$COLOR1└─────────────────────────────────────────────────┘${NC}"
echo -e ""
echo -ne " ${WH}Select menu ${COLOR1}: ${WH}"; read opt
case $opt in
01 | 1) clear ; usernew ; exit ;;
02 | 2) clear ; renew ; exit ;;
03 | 3) clear ; hapus ; exit ;;
04 | 4) clear ; login ; exit ;;
05 | 5) clear ; cekconfig ; exit ;;
06 | 6) clear ; user-lock ; exit ;;
07 | 7) clear ; user-unlock ; exit ;;
08 | 8) clear ; autokill ; exit ;;
09 | 9) clear ; trial ; exit ;;
10 | 10) clear ; member ; exit ;;
00 | 0) clear ; menu ; exit ;;
X  | 0) clear ; menu ;;
x) exit ;;
*) echo " salah tekan sayang" ; sleep 1 ; menu-ssh ;;
esac
