#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
###########- COLOR CODE -##############
BGreen='\e[1;32m'
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\e[32;1m'
YB='\e[33;1m'
BB='\e[34;1m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
###########- COLOR CODE -##############

clear
fun_bar () {
comando[0]="$1"
comando[1]="$2"
 (
[[ -e $HOME/fim ]] && rm $HOME/fim
${comando[0]} -y > /dev/null 2>&1
${comando[1]} -y > /dev/null 2>&1
touch $HOME/fim
 ) > /dev/null 2>&1 &
 tput civis
echo -ne "  \033[1;33mTUNGGU \033[1;37m- \033[1;33m["
while true; do
   for((i=0; i<18; i++)); do
   echo -ne "\033[1;31m#"
   sleep 0.1s
   done
   [[ -e $HOME/fim ]] && rm $HOME/fim && break
   echo -e "\033[1;33m]"
   sleep 1s
   tput cuu1
   tput dl1
   echo -ne "  \033[1;33mTUNGGU \033[1;37m- \033[1;33m["
done
echo -e "\033[1;33m]\033[1;37m -\033[1;32m OK !\033[1;37m"
tput cnorm
}
clear
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%40s%s%-12s\n' "Install SlowDns" ; tput sgr0
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo -e ""
echo -e "          Update AutoScript "
echo -e "      Pembaharuan Menu Autoscript"
echo -e ""
echo -e "         \033[1;33mSambil Ngopi Dulu Biar Semangat\033[1;37m"
echo -e "\033[1;31m════════════════════════════════════════════════════\033[0m"
echo ""
echo -e "Menginstall Websocket..."
echo ""
ibam () {
wget https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/insshws.sh && chmod +x insshws.sh && ./insshws.sh"
}
fun_bar 'ibam'
echo -e "Mengungduh Menu Update..."
echo ""
echo -e "\e[1;36mYES BERHASIL\e[0m"
sleep 2
clear
echo ""
echo -e "\033[0;34m----------------------------------------\033[0m"
echo -e "\E[44;1;39m            Websocket Terinstall              \E[0m"
echo -e "\033[0;34m----------------------------------------\033[0m"
echo ""
