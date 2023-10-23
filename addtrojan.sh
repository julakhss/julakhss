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
# Getting
CHATID=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 3)
KEY=$(grep -E "^#bot# " "/etc/bot/.bot.db" | cut -d ' ' -f 2)
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)
echo -e "\e[32mloading...\e[0m"
clear
# Valid Script
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
    echo -e "            ${RED}PERMISSION DENIED !${NC}"
    echo -e "   \033[0;33mYour VPS${NC} $ipsaya \033[0;33mHas been Banned${NC}"
    echo -e "     \033[0;33mBuy access permissions for scripts${NC}"
    echo -e "             \033[0;33mContact Admin :${NC}"
    echo -e "      \033[0;36mTelegram${NC} t.me/Cibut2d"
    echo -e "      ${GREEN}WhatsApp${NC} wa.me/6281250851741"
    echo -e "\033[1;93m────────────────────────────────────────────\033[0m"
    exit
  fi
}
checking_sc
echo -e "\e[32mloading...\e[0m"
clear
source /var/lib/julak/ipvps.conf
if [[ "$IP" = "" ]]; then
domain=$(cat /etc/xray/domain)
else
domain=$IP
fi
#tr="$(cat ~/log-install.txt | grep -w "Trojan WS " | cut -d: -f2|sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
echo -e "$COLBG1        Add Xray/Trojan Account          $NC"
echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"

		read -rp "User: " -e user
		user_EXISTS=$(grep -w $user /etc/xray/config.json | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
clear
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
    echo -e "$COLBG1        Add Xray/Trojan Account          $NC"
    echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
			echo ""
			echo "A client with the specified name was already created, please choose another name."
			echo ""
			echo -e "$COLOR1━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$NC"
			read -n 1 -s -r -p "Press any key to back on menu"
			m-trojan
		fi
	done

PUB=$(cat /etc/slowdns/server.pub)
NS=$(cat /etc/xray/dns)
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
#read -p "Limit User (GB): " Quota
read -p "Limit User (IP): " iplimit
tgl=$(date -d "$masaaktif days" +"%d")
bln=$(date -d "$masaaktif days" +"%b")
thn=$(date -d "$masaaktif days" +"%Y")
expe="$tgl $bln, $thn"
tgl2=$(date +"%d")
bln2=$(date +"%b")
thn2=$(date +"%Y")
tnggl="$tgl2 $bln2, $thn2"
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#trojanws$/a\#! '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json
sed -i '/#trojangrpc$/a\#trg '"$user $exp"'\
},{"password": "'""$uuid""'","email": "'""$user""'"' /etc/xray/config.json

# Link Trojan Akun
systemctl restart xray
trojanlink3="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=auto&host=${domain}&type=ws#${user}"

cat >/var/www/html/trojan-$user.txt <<-END

---------------------
Format Trojan GO/WS
---------------------
- name: Trojan-$user-GO/WS
  server: ${domain}
  port: 443
  type: trojan
  password: ${uuid}
  network: ws
  sni: ${domain}
  skip-cert-verify: true
  udp: true
  ws-opts:
    path: /trojan-ws
    headers:
        Host: ${domain}

---------------------
Format Trojan gRPC
---------------------
- name: Trojan-$user-gRPC
  type: trojan
  server: ${domain}
  port: 443
  password: ${uuid}
  udp: true
  sni: ${domain}
  skip-cert-verify: true
  network: grpc
  grpc-opts:
    grpc-service-name: trojan-grpc
END

TEXT="
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link Akun Trojan </code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link WS          : </code>
<code>${trojanlink1}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
<code>Link GRPC        : </code>
<code>${trojanlink3}</code>
<code>◇━━━━━━━━━━━━━━━━━◇</code>
"



systemctl reload xray
systemctl reload nginx
service cron restart
trojanlink3="trojan://${uuid}@${domain}:443?mode=gun&security=tls&type=grpc&serviceName=trojan-grpc&sni=${domain}#${user}"
trojanlink1="trojan://${uuid}@${domain}:443?path=%2Ftrojan-ws&security=tls&host=${domain}&type=ws&sni=${domain}#${user}"
trojanlink2="trojan://${uuid}@${domain}:80?path=%2Ftrojan-ws&security=auto&host=${domain}&type=ws#${user}"
if [ ! -e /etc/trojan ]; then
  mkdir -p /etc/trojan
fi

if [[ $iplimit -gt 0 ]]; then
mkdir -p /etc/julak/limit/trojan/ip
echo -e "$iplimit" > /etc/julak/limit/trojan/ip/$user
else
echo > /dev/null
fi

if [ -z ${Quota} ]; then
  Quota="0"
fi

c=$(echo "${Quota}" | sed 's/[^0-9]*//g')
d=$((${c} * 1024 * 1024 * 1024))

if [[ ${c} != "0" ]]; then
  echo "${d}" >/etc/trojan/${user}
fi
DATADB=$(cat /etc/trojan/.trojan.db | grep "^###" | grep -w "${user}" | awk '{print $2}')
if [[ "${DATADB}" != '' ]]; then
  sed -i "/\b${user}\b/d" /etc/trojan/.trojan.db
fi
echo "### ${user} ${exp} ${uuid} ${iplimit}" >>/etc/trojan/.trojan.db
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL
clear
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e " CREATE TROJAN ACCOUNT          " | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[1;93m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Remarks         : ${user}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Host/IP         : ${domain}" | tee -a /etc/xray/log-create-${user}.log
echo -e "User Ip         : ${iplimit} IP" | tee -a /etc/xray/log-create-${user}.log
echo -e "Xray Dns        : ${NS}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Pubkey          : ${PUB}" | tee -a /etc/xray/log-create-${user}.log
echo -e "Id             : ${uuid}" | tee -a /etc/xray/log-create-${user}.log
echo -e "port  TLS       : 443" | tee -a /etc/xray/log-create-${user}.log
echo -e "port None TLS   : 80" | tee -a /etc/xray/log-create-${user}.log
echo -e "Port  TLS       : 443" | tee -a /etc/xray/log-create-${user}.log
echo -e "Path            : (/multipath)/trojan-ws" | tee -a /etc/xray/log-create-${user}.log
echo -e "ServiceName     : trojan-grpc" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link TLS        : " | tee -a /etc/xray/log-create-${user}.log
echo -e "${trojanlink1}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link None TLS   : " | tee -a /etc/xray/log-create-${user}.log
echo -e "${trojanlink2}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Link GRPC       : " | tee -a /etc/xray/log-create-${user}.log
echo -e "${trojanlink3}" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo -e "Format OpenClash : https://${domain}:81/trojan-$user.txt" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m"  | tee -a /etc/xray/log-create-${user}.log
echo -e "Expired    : $expe" | tee -a /etc/xray/log-create-${user}.log
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━\033[0m" | tee -a /etc/xray/log-create-${user}.log
echo "" | tee -a /etc/xray/log-create-${user}.log
