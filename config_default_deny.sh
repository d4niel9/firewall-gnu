#!/bin/bash
#Reiniciar valores de firewall
iptables -t filter -F
iptables -t nat -F

iptables -t filter -Z
iptables -t nat -Z
#Denegar todo el trafico
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

