#!/bin/bash
#Permitir  ping request, denegar ping reply
iptables -I OUTPUT -o enp0s3 -p icmp --icmp-type echo-request -j ACCEPT
iptables -I INPUT -i enp0s3 -p icmp --icmp-type echo-reply -j ACCEPT

#Habilitar systemd-resolve
iptables -I OUTPUT -o lo -j ACCEPT
iptables -I INPUT -i lo -j ACCEPT

#Permitir consultas y respuestas DNS
iptables -A OUTPUT -o enp0s3 -p udp --dport 53 -j ACCEPT
iptables -A INPUT -i enp0s3 -p udp --sport 53 -j ACCEPT

iptables -A OUTPUT -o enp0s3 -p tcp --dport 53 -j ACCEPT
iptables -A INPUT -i enp0s3 -p tcp --sport 53 -j ACCEPT

#Permitir tráfico HTTPS
iptables -A OUTPUT -o enp0s3 -p tcp --dport 443 -j ACCEPT
iptables -A INPUT -i enp0s3 -p tcp --sport 443 -j ACCEPT
