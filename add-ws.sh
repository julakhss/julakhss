#!/bin/bash
# //====================================================
# //	System Request:Debian 9+/Ubuntu 18.04+/20+
# //	Author:	Julak Bantur
# //	Dscription: Xray Menu Management
# //	email: putrameratus2@gmail.com
# //  telegram: https://t.me/Cibut2d
# //====================================================
###########- COLOR CODE -##############
colornow=$(cat /etc/julak/theme/color.conf)
NC="\e[0m"
RED="\033[0;31m"
COLOR1="$(cat /etc/julak/theme/$colornow | grep -w "TEXT" | cut -d: -f2|sed 's/ //g')"
COLBG1="$(cat /etc/julak/theme/$colornow | grep -w "BG" | cut -d: -f2|sed 's/ //g')"
WH='\033[1;37m'
###########- END COLOR CODE -##########
# // font color configuration | JULAK BANTUR AUTOSCRIPT
Green="\e[92;1m"
RED="\033[31m"
YELLOW="\033[33m"
BLUE="\033[36m"
FONT="\033[0m"
GREENBG="\033[42;37m"
REDBG="\033[41;37m"
OK="${Green}--->${FONT}"
ERROR="${RED}[ERROR]${FONT}"
GRAY="\e[1;30m"
NC='\e[0m'
red='\e[1;31m'
green='\e[0;32m'
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[32;1m${*}\\033[0m"; }
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
domain=$(cat /etc/xray/domain)
ipsaya=$(wget -qO- ipinfo.io/ip)
data_server=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
date_list=$(date +"%Y-%m-%d" -d "$data_server")
data_ip="https://raw.githubusercontent.com/bagusid93/hss/main/sc3"
checking_sc() {
  useexp=$(wget -qO- $data_ip | grep $ipsaya | awk '{print $3}')
  if [[ $date_list < $useexp ]]; then
    echo -ne
  else
    echo -e "$COLOR1────────────────────────────────────────────\033[0m"
    echo -e "\033[42m          JULAK BANTUT AUTOSCRIPT          \033[0m"
    echo -e "$COLOR1────────────────────────────────────────────\033[0m"
    echo -e ""
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Cibut2d"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281250851741"
    echo -e "\033[1;93m────────────────────────────────────────────$NC"
    exit
  fi
}
checking_sc
clear
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
  clear
  echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
  echo -e "$COLBG1         Add Xray/Vmess Account          $NC"
  echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"

  read -rp "User: " -e user
  CLIENT_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

  if [[ ${CLIENT_EXISTS} == '1' ]]; then
    clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1         Add Xray/Vmess Account          $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo ""
    echo "A client with the specified name was already created, please choose another name."
    echo ""
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    read -n 1 -s -r -p "Press any key to back on menu"
    menu
  fi
done

uuid=$(cat /proc/sys/kernel/random/uuid)
sec=3
spinner=(⣻ ⢿ ⡿ ⣟ ⣯ ⣷)
while [ $sec -gt 0 ]; do
    echo -ne "$RED ${spinner[sec]} Setting up a Premium Account $sec seconds...\r$NC"
    sleep 1
    sec=$(($sec - 1))
done
clear 
echo -e "\e[1;32mINPUT DEPENDECIES ACCOUNT $user\e[0m\n"
until [[ $masaaktif =~ ^[0-9]+$ ]]; do
read -p "Expired (days): " masaaktif
done
until [[ $Quota =~ ^[0-9]+$ ]]; do
read -p "Limit User (GB): " Quota
done
until [[ $iplim =~ ^[0-9]+$ ]]; do
read -p "Limit User (IP): " iplim
done
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vmess$/a\#vm '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
exp=$(date -d "$masaaktif days" +"%Y-%m-%d")
sed -i '/#vmessgrpc$/a\#vmg '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /etc/xray/config.json
VMESS_WS=`cat<<EOF
      {
      "v": "2",
      "ps": "$user WS (CDN) TLS",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
VMESS_NON_TLS=`cat<<EOF
      {
      "v": "2",
      "ps": "$user WS (CDN) NTLS",
      "add": "${domain}",
      "port": "80",
      "id": "${uuid}",
      "aid": "0",
      "net": "ws",
      "path": "/vmess",
      "type": "none",
      "host": "${domain}",
      "tls": "none"
}
EOF`
VMESS_GRPC=`cat<<EOF
      {
      "v": "2",
      "ps": "$user (SNI) GRPC",
      "add": "${domain}",
      "port": "443",
      "id": "${uuid}",
      "aid": "0",
      "net": "grpc",
      "path": "vmess-grpc",
      "type": "none",
      "host": "${domain}",
      "tls": "tls"
}
EOF`
cat >/var/www/html/vmess-$user.txt <<-END

---------------------
# Format Vmess WS (CDN)
---------------------

- name: Vmess-$user-WS (CDN)
  type: vmess
  server: ${domain}
  port: 443
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: true
  skip-cert-verify: true
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
---------------------
# Format Vmess WS (CDN) Non TLS
---------------------

- name: Vmess-$user-WS (CDN) Non TLS
  type: vmess
  server: ${domain}
  port: 80
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  udp: true
  tls: false
  skip-cert-verify: false
  servername: ${domain}
  network: ws
  ws-opts:
    path: /vmess
    headers:
      Host: ${domain}
---------------------
# Format Vmess gRPC (SNI)
---------------------

- name: Vmess-$user-gRPC (SNI)
  server: ${domain}
  port: 443
  type: vmess
  uuid: ${uuid}
  alterId: 0
  cipher: auto
  network: grpc
  tls: true
  servername: ${domain}
  skip-cert-verify: true
  grpc-opts:
    grpc-service-name: vmess-grpc

---------------------
# Link Vmess Account
---------------------
Link TLS : vmess://$(echo $VMESS_WS | base64 -w 0)
---------------------
Link none TLS : vmess://$(echo $VMESS_NON_TLS | base64 -w 0)
---------------------
Link GRPC : vmess://$(echo $VMESS_GRPC | base64 -w 0)
---------------------



END
vmesslink1="vmess://$(echo $VMESS_WS | base64 -w 0)"
vmesslink2="vmess://$(echo $VMESS_NON_TLS | base64 -w 0)"
vmesslink3="vmess://$(echo $VMESS_GRPC | base64 -w 0)"
TEXT="
<code>───────────────────────────</code>
<code>     Xray/Vmess Account</code>
<code>───────────────────────────</code>
<code>Remarks      : </code><code>${user}</code>
<code>Domain       : </code><code>${domain}</code>
<code>User Quota   : </code><code>${Quota} GB</code>
<code>Port TLS     : 443</code>
<code>Port NTLS    : 80</code>
<code>Port GRPC    : 443</code>
<code>User ID      : </code><code>${uuid}</code>
<code>AlterId      : 0</code>
<code>Security     : auto</code>
<code>Network      : WS or gRPC</code>
<code>Path TLS     : (/multi path)</code>
<code>Path NLS     : (/multi path)</code>
<code>Path Dynamic : http://BUG.COM</code>
<code>ServiceName  : vmess-grpc</code>
<code>───────────────────────────</code>
<code>Link TLS     :</code> 
<code>${vmesslink1}</code>
<code>───────────────────────────</code>
<code>Link NTLS    :</code> 
<code>${vmesslink2}</code>
<code>───────────────────────────</code>
<code>Link GRPC    :</code> 
<code>${vmesslink3}</code>
<code>───────────────────────────</code>
<code>Expired On : $exp</code>
<code>───────────────────────────</code>
"
systemctl restart xray
if [ ! -e /etc/vmess ]; then
  mkdir -p /etc/vmess
fi
if [ -z ${iplim} ]; then
  iplim="0"
fi
if [ -z ${Quota} ]; then
  Quota="0"
fi
c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))
if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/vmess/${user}
  echo "${iplim}" >/etc/vmess/${user}IP
fi
DATADB=$(cat /etc/vmess/.vmess.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/vmess/.vmess.db
fi
echo "### ${user} ${exp} ${uuid} ${iplim}" >>/etc/vmess/.vmess.db
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLBG1    Xray/Vmess Account     $NC" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Remarks      : ${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Host Server  : ${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "User Quota   : ${Quota} GB" | tee -a /etc/xray/log-create-${user}.log
echo -e "User IP      : ${iplim} IP" | tee -a /etc/xray/log-create-${user}.log
echo -e "port TLS     : 443" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port NTLS    : 80" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port GRPC    : 443" | tee -a /etc/xray/log-create-${user}.log
echo -e "User ID      : ${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "AlterId      : 0" | tee -a /etc/xray/log-create-${user}.log
echo -e "Security     : auto" | tee -a /etc/xray/log-create-${user}.log
echo -e "Network      : WS or gRPC" | tee -a /etc/xray/log-create-${user}.log
echo -e "Path TLS     : (/multi path)/vmess " | tee -a /etc/xray/log-create-${user}.log
echo -e "Path NTLS    : (/multi path)/vmess " | tee -a /etc/xray/log-create-${user}.log
echo -e "Path Dynamic : http://BUG.COM/vmess " | tee -a /etc/xray/log-create-${user}.log
echo -e "ServiceName  : vmess-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link TLS     : ${vmesslink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link NTLS    : ${vmesslink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link GRPC    : ${vmesslink3}" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Expired On : $exp" | tee -a /etc/xray/log-create-${user}.log
echo -e "$COLOR1───────────────────────────\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "" | tee -a /etc/xray/log-create-${user}.log
