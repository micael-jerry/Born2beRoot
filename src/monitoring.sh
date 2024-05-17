#!/bin/bash

architecture=$(uname -a)

physical_cpu=$(grep "physical id" /proc/cpuinfo | sort -u | wc -l)
virtual_cpu=$(grep "processor" /proc/cpuinfo | wc -l)

total_mem=$(free -m | awk '{ if($1 == "Mem:") print $2 }')
used_mem=$(free -m | awk '{ if($1 == "Mem:") print $3 }')
usage_rate_mem=$(( (used_mem * 100) / total_mem))

total_disk=$(df -h / | awk '{ if($6 == "/") print $2}')
used_disk=$(df -h / | awk '{ if($6 == "/") print $3}')
usage_rate_disk=$(df -h / | awk '{ if($6 == "/") print $5}')

last_boot=$(uptime -s)

connexions_tcp=$(w -h | wc -l)
user_log_in=$(who -u | wc -l)

ip_addr=$(hostname -I | awk '{print $1}')
mac_addr=$(ip link | awk '{ if($1 == "link/ether") print $2}')

cmd_sudo=$(journalctl -q | grep 'sudo' | grep 'COMMAND' | wc -l)

echo "#Architecture:    $architecture"
echo "#CPU physical:    $physical_cpu"
echo "#vCPU:            $virtual_cpu"
echo "#Memory usage:    $used_mem/$total_mem Mb ($usage_rate_mem %)"
echo "#Disk usage:      $used_disk/$total_disk ($usage_rate_disk)"
# usage cpu rate
echo "#Last boot:       $last_boot"
# lvm is actif ?
echo "#Connexions TCP:  $connexions_tcp"
echo "#User log:        $user_log_in"
echo "#IPv4:            $ip_addr        #MAC:   $mac_addr"
echo "#Sudo:            $cmd_sudo"
