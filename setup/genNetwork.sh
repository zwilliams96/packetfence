#!/bin/bash

source /opt/packetfence/config/interfaces.env

cat <<EOF > /etc/netplan/00-packetfence.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    $LAN_IFACE:
      dhcp4: no
      addresses: [192.168.100.1/24]
      nameservers:
        addresses: [8.8.8.8, 1.1.1.1]
    $WAN_IFACE:
      dhcp4: yes
EOF

netplan apply
