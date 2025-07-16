#!/bin/bash
set -e

source /opt/packetfence/config/interfaces.env

echo "[+] Building base.nft from template..."
sed \
  -e "s|\$WAN_IFACE|$WAN_IFACE|g" \
  -e "s|\$LAN_IFACE|$LAN_IFACE|g" \
  /opt/packetfence/firewall/rules/base_template.nft > /opt/packetfence/firewall/rules/base.nft

sed \
  -e "s|\$LAN_IFACE|$LAN_IFACE|g" \
  -e "s|\$WAN_IFACE|$WAN_IFACE|g" \
  /opt/packetfence/firewall/rules/user_forward_template.nft > /opt/packetfence/firewall/rules/user_forward.nft

sed \
  -e "s|\$LAN_IFACE|$LAN_IFACE|g" \
  -e "s|\$WAN_IFACE|$WAN_IFACE|g" \
 /opt/packetfence/firewall/rules/user_input_template.nft > /opt/packetfence/firewall/rules/user_input.nft

sed \
  -e "s|\$LAN_IFACE|$LAN_IFACE|g" \
  -e "s|\$WAN_IFACE|$WAN_IFACE|g" \
 /opt/packetfence/firewall/rules/user_output_template.nft > /opt/packetfence/firewall/rules/user_output.nft


/usr/sbin/nft -f /opt/packetfence/firewall/rules/base.nft
