#!/bin/bash

inaIP=$(wget -qO- ipv4.icanhazip.com)
timenow=$(date +%T)
tim2sec() {
  mult=1
  arg="$1"
  inu=0
  while [ ${#arg} -gt 0 ]; do
    prev="${arg%:*}"
    if [ "$prev" = "$arg" ]; then
      curr="${arg#0}"
      prev=""
    else
      curr="${arg##*:}"
      curr="${curr#0}"
    fi
    curr="${curr%.*}"
    inu=$((inu + curr * mult))
    mult=$((mult * 60))
    arg="$prev"
  done
  echo "$inu"
}
# ------ VMESS IP
function vmess() {
  vm=($(cat /etc/vmess/.vmess.db | grep "^###" | awk '{print $2}' | sort -u))
  echo -n >/tmp/vm
  for db1 in ${vm[@]}; do
    logvm=$(cat /var/log/xray/access.log | grep -w "email: ${db1}" | tail -n 150)
    while read a; do
      if [[ -n ${a} ]]; then
        set -- ${a}
        ina="${7}"
        inu="${2}"
        anu="${3}"
        enu=$(echo "${anu}" | sed 's/tcp://g' | sed '/^$/d' | cut -d. -f1,2,3)
        now=$(tim2sec ${timenow})
        client=$(tim2sec ${inu})
        nowt=$(((${now} - ${client})))
        if [[ ${nowt} -lt 40 ]]; then
          cat /tmp/vm | grep -w "${ina}" | grep -w "${enu}" >/dev/null
          if [[ $? -eq 1 ]]; then
            echo "${ina} ${inu} ${enu}" >>/tmp/vm
            splvm=$(cat /tmp/vm)
          fi
        fi
      fi
    done <<<"${logvm}"
  done
  if [[ ${splvm} != "" ]]; then
    for vmuser in ${vm[@]}; do
      vmhas=$(cat /tmp/vm | grep -w "${vmuser}" | wc -l)
      vmsde=$(ls "/etc/vmess" | grep -w "${vmuser}IP")
      if [[ -z ${vmsde} ]]; then
        vmip="0"
      else
        vmip=$(cat /etc/vmess/${vmuser}IP)
      fi
      if [[ ${vmhas} -gt $vmip ]]; then
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
        TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   ⚠️VMESS NOTIF⚠️</b>
<b>     User Multi Login</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>USERNAME :</b> <code>$vmuser </code>
<b>TOTAL IP :</b> <code>${vmhas} </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>I REMOVE ACCOUNT</code>
<code>NO MULTI LOGINS!</code>
"
        curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
         exp=$(grep -wE "^#vm $vmuser" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
         sed -i "/^#vm $vmuser $exp/,/^},{/d" /etc/xray/config.json
         sed -i "/^#vmg $vmuser $exp/,/^},{/d" /etc/xray/config.json
         sed -i "/^### $vmuser $exp/d" /etc/vmess/.vmess.db
         systemctl restart xray
      fi
    done
  fi
}
# ------ VLESS IP
function vless() {
  vldat=($(cat /etc/vless/.vless.db | grep "^###" | awk '{print $2}' | sort -u))
  echo -n >/tmp/vl
  for db2 in ${vldat[@]}; do
    logvl=$(cat /var/log/xray/access.log | grep -w "email: ${db2}" | tail -n 150)
    while read a; do
      if [[ -n ${a} ]]; then
        set -- ${a}
        ina="${7}"
        inu="${2}"
        anu="${3}"
        enu=$(echo "${anu}" | sed 's/tcp://g' | sed '/^$/d' | cut -d. -f1,2,3)
        now=$(tim2sec ${timenow})
        client=$(tim2sec ${inu})
        nowt=$(((${now} - ${client})))
        if [[ ${nowt} -lt 40 ]]; then
          cat /tmp/vl | grep -w "${ina}" | grep -w "${enu}" >/dev/null
          if [[ $? -eq 1 ]]; then
            echo "${ina} ${inu} ${enu}" >>/tmp/vl
            spll=$(cat /tmp/vl)
          fi
        fi
      fi
    done <<<"${logvl}"
  done
  if [[ ${spll} != "" ]]; then
    for vlus in ${vldat[@]}; do
      vlsss=$(cat /tmp/vl | grep -w "${vlus}" | wc -l)
      sdf=$(ls "/etc/vless" | grep -w "${vlus}IP")
      if [[ -z ${sdf} ]]; then
        vmip="0"
      else
        vmip=$(cat /etc/vless/${vlus}IP)
      fi
      if [[ ${vlsss} -gt $vmip ]]; then
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
        TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   ⚠️VLESS NOTIF⚠️</b>
<b>     User Multi Login</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>USERNAME :</b> <code>$vlus </code>
<b>TOTAL IP :</b> <code>${vlsss} </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>I REMOVE ACCOUNT</code>
<code>NO MULTI LOGINS!</code>
"
        curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
         expvl=$(grep -wE "^#& $vlus" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
         sed -i "/^#& $vlus $expvl/,/^},{/d" /etc/xray/config.json
         sed -i "/^#vlg $vlus $expvl/,/^},{/d" /etc/xray/config.json
         sed -i "/^### $vlus $expvl/d" /etc/vless/.vless.db
         rm /etc/xray/log-create-${vlus}.log
        systemctl restart xray
      fi
    done
  fi
}
# ------ TROJAN IP
function trojan() {
  trda=($(cat /etc/trojan/.trojan.db | grep "^###" | awk '{print $2}' | sort -u))
  echo -n >/tmp/tr
  for db3 in ${trda[@]}; do
    logtr=$(cat /var/log/xray/access.log | grep -w "email: ${db3}" | tail -n 150)
    while read a; do
      if [[ -n ${a} ]]; then
        set -- ${a}
        ina="${7}"
        inu="${2}"
        anu="${3}"
        enu=$(echo "${anu}" | sed 's/tcp://g' | sed '/^$/d' | cut -d. -f1,2,3)
        now=$(tim2sec ${timenow})
        client=$(tim2sec ${inu})
        nowt=$(((${now} - ${client})))
        if [[ ${nowt} -lt 40 ]]; then
          cat /tmp/tr | grep -w "${ina}" | grep -w "${enu}" >/dev/null
          if [[ $? -eq 1 ]]; then
            echo "${ina} ${inu} ${enu}" >>/tmp/tr
            restr=$(cat /tmp/tr)
          fi
        fi
      fi
    done <<<"${logtr}"
  done
  if [[ ${restr} != "" ]]; then
    for usrtr in ${trda[@]}; do
      trip=$(cat /tmp/tr | grep -w "${usrtr}" | wc -l)
      sdf=$(ls "/etc/trojan" | grep -w "${usrtr}IP")
      if [[ -z ${sdf} ]]; then
        sadsde="0"
      else
        sadsde=$(cat /etc/trojan/${usrtr}IP)
      fi
      if [[ ${trip} -gt $sadsde ]]; then
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
        TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>   ⚠️TROJAN NOTIF⚠️</b>
<b>      User Multi Login</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>USERNAME :</b> <code>$usrtr </code>
<b>TOTAL IP :</b> <code>${trip} </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>I REMOVE ACCOUNT</code>
<code>NO MULTI LOGINS!</code>
"
        curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
         xptr=$(grep -wE "^#! $usrtr" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
         sed -i "/^#! $usrtr $xptr/,/^},{/d" /etc/xray/config.json
         sed -i "/^#trg $usrtr $xptr/,/^},{/d" /etc/xray/config.json
         sed -i "/^### $usrtr $xptr/d" /etc/trojan/.trojan.db
         rm /etc/xray/log-create-${usrtr}.log
         systemctl restart xray >/dev/null 2>&1
      fi
    done
  fi
}
# ------ SHDWSCK IP
function shdwsk() {
  ssdt=($(cat /etc/shadowsocks/.shadowsocks.db | grep "^###" | awk '{print $2}' | sort -u))
  echo -n >/tmp/ss
  for db4 in ${ssdt[@]}; do
    logss=$(cat /var/log/xray/access.log | grep -w "email: ${db4}" | tail -n 150)
    while read a; do
      if [[ -n ${a} ]]; then
        set -- ${a}
        ina="${7}"
        inu="${2}"
        anu="${3}"
        enu=$(echo "${anu}" | sed 's/tcp://g' | sed '/^$/d' | cut -d. -f1,2,3)
        now=$(tim2sec ${timenow})
        client=$(tim2sec ${inu})
        nowt=$(((${now} - ${client})))
        if [[ ${nowt} -lt 40 ]]; then
          cat /tmp/ss | grep -w "${ina}" | grep -w "${enu}" >/dev/null
          if [[ $? -eq 1 ]]; then
            echo "${ina} ${inu} ${enu}" >>/tmp/ss
            dewacs=$(cat /tmp/ss)
          fi
        fi
      fi
    done <<<"${logss}"
  done
  if [[ ${dewacs} != "" ]]; then
    for sdfe in ${ssdt[@]}; do
      decv=$(cat /tmp/ss | grep -w "${sdfe}" | wc -l)
      ergeger=$(ls "/etc/shadowsocks" | grep -w "${decv}IP")
      if [[ -z ${ergeger} ]]; then
        sdsrr="0"
      else
        sdsrr=$(cat /etc/shadowsocks/${decv}IP)
      fi
      if [[ ${decv} -gt $sdsrr ]]; then
TIMES="10"
CHATID=$(cat /etc/per/id)
KEY=$(cat /etc/per/token)
URL="https://api.telegram.org/bot$KEY/sendMessage"
        TEXT="
<code>◇━━━━━━━━━━━━━━◇</code>
<b>  ⚠️SHDWSCK NOTIF⚠️</b>
<b>      User Multi Login</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>USERNAME :</b> <code>$sdfe </code>
<b>TOTAL IP :</b> <code>${decv} </code>
<code>◇━━━━━━━━━━━━━━◇</code>
<code>I REMOVE ACCOUNT</code>
<code>NO MULTI LOGINS!</code>
"
        curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
         xpss=$(grep -wE "^###& $sdfe" "/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
         sed -i "/^###& $sdfe $xpss/,/^},{/d" /etc/xray/config.json
         sed -i "/^### $sdfe $xpss/d" /etc/shadowsocks/.shadowsocks.db
         rm /etc/xray/log-create-${sdfe}.log
         systemctl restart xray >/dev/null 2>&1
      fi
    done
  fi
}
vmess
vless
trojan
shdwsk
