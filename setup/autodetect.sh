#!/bin/bash

# Get all non-loopback, UP interfaces
interfaces=($(ip -o link show | awk -F': ' '/state UP/ && $2 != "lo" {print $2}'))

# Naive default: first = WAN, second = LAN (reverse if needed)
WAN_IFACE="${interfaces[0]}"
LAN_IFACE="${interfaces[1]}"

echo "Detected WAN: $WAN_IFACE"
echo "Detected LAN: $LAN_IFACE"

# Save to file for reuse
echo "WAN_IFACE=$WAN_IFACE" > /opt/packetfence/config/interfaces.env
echo "LAN_IFACE=$LAN_IFACE" >> /opt/packetfence/config/interfaces.env
