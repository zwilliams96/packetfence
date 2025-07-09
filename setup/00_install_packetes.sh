#!/bin/bash

set -e

echo "[+] Installing packeges..."

apt update

apt install -y nftables python3 git curl iproute2 net-tools systemd-resolved
