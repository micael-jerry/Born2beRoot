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

lvm_count=$(lsblk | grep 'lvm' | wc -l)
lvm_is_active="no"
if [ "$lvm_count" -gt 0 ]; then
        lvm_is_active="yes"
fi

connexions_tcp=$(netstat --tcp | grep 'ESTABLISHED' | wc -l)
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
echo "#LVM use: $lvm_is_active"
echo "#TCP:             $connexions_tcp ESTABLISHED"
echo "#User log:        $user_log_in"
echo "#IPv4:            $ip_addr        #MAC:   $mac_addr"
echo "#Sudo:            $cmd_sudo"
