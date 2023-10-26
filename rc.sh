#!/bin/bash

cat >/etc/systemd/system/rc-local.service <<-END
		[Unit]
		Description=/etc/rc.local
		ConditionPathExists=/etc/rc.local
		[Service]
		Type=forking
		ExecStart=/etc/rc.local start
		TimeoutSec=0
		StandardOutput=tty
		RemainAfterExit=yes
		SysVStartPriority=99
		[Install]
		WantedBy=multi-user.target
	END

    echo "/bin/false" >>/etc/shells
    echo "/usr/sbin/nologin" >>/etc/shells
    cat >/etc/rc.local <<-END
		#!/bin/sh -e
		# rc.local
		# By default this script does nothing.
		#iptables -I INPUT -p udp --dport 5300 -j ACCEPT
		#iptables -t nat -I PREROUTING -p udp --dport 53 -j REDIRECT --to-ports 5300
		netfilter-persistent reload
		#exit 0
	END
    chmod +x /etc/rc.local
