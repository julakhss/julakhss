#!/bin/bash
#installer Websocker tunneling 

cd
apt install python -y

#Install Script Websocket-SSH Python
#wget -O /usr/local/bin/edu-proxy https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/openssh.py
wget -O /usr/local/bin/ws-dropbear https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/dropbear-ws.py
wget -O /usr/local/bin/ws-stunnel https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/ws-stunnel.txt
wget -O /usr/local/bin/ws-ovpn https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/ovpn.py

#izin permision
#chmod +x /usr/local/bin/edu-proxy
chmod +x /usr/local/bin/ws-dropbear
chmod +x /usr/local/bin/ws-stunnel
chmod +x /usr/local/bin/ws-ovpn


#System OpenSSH Websocket-SSH Python
#wget -O /etc/systemd/system/edu-proxy.service https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/http.service && chmod +x /etc/systemd/system/edu-proxy.service

#System Dropbear Websocket-SSH Python
wget -O /etc/systemd/system/ws-dropbear.service https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/service-wsdropbear.txt && chmod +x /etc/systemd/system/ws-dropbear.service

#System SSL/TLS Websocket-SSH Python
wget -O /etc/systemd/system/ws-stunnel.service https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/ws-stunnel.service.txt && chmod +x /etc/systemd/system/ws-stunnel.service

##System Websocket-OpenVPN Python
wget -O /etc/systemd/system/ws-ovpn.service https://raw.githubusercontent.com/julakhss/julakhss/main/JB1/ovpn.service && chmod +x /etc/systemd/system/ws-ovpn.service

#restart service
#
systemctl daemon-reload
#Enable & Start & Restart ws-openssh service
#systemctl enable ws-openssh.service
#systemctl start ws-openssh.service
#systemctl restart ws-openssh.service

#Enable & Start & Restart ws-dropbear service
systemctl enable ws-dropbear.service
systemctl start ws-dropbear.service
systemctl restart ws-dropbear.service

#Enable & Start & Restart ws-openssh service
systemctl enable ws-stunnel.service
systemctl start ws-stunnel.service
systemctl restart ws-stunnel.service

#Enable & Start ws-ovpn service
systemctl enable ws-ovpn.service
systemctl start ws-ovpn.service
systemctl restart ws-ovpn.service
