#!/bin/bash
# Network Device Monitor - macOS Version
# Author: Antik Mondal
# Description: Scan local network, show connected devices, log new devices

# ---------------- Configuration ----------------
LOG_FILE="devices.log"

# ---------------- Auto-detect Network Prefix ----------------
# Get Mac's IP
IP_ADDR=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}' | head -n1)
# Extract first three octets (e.g., 192.168.1)
NETWORK_PREFIX=$(echo "$IP_ADDR" | cut -d. -f1-3)

echo "[INFO] Your IP: $IP_ADDR"
echo "[INFO] Scanning network $NETWORK_PREFIX.0/24..."

# ---------------- Scan Network ----------------
for i in $(seq 1 254); do
    ping -c 1 -W 1 "$NETWORK_PREFIX.$i" &> /dev/null &
done
wait

# ---------------- Get Devices ----------------
arp -a > current_devices.log

# Extract IP and MAC addresses
awk '{print $2, $4}' current_devices.log | tr -d '()' > current_clean.log

# ---------------- Compare with Previous Log ----------------
if [ ! -f $LOG_FILE ]; then
    touch $LOG_FILE
fi

echo "Connected Devices:"
while read -r line; do
    echo "$line"
    if ! grep -q "$line" "$LOG_FILE"; then
        echo "⚡ New Device Detected: $line"
    fi
done < current_clean.log

# ---------------- Save Current Devices ----------------
cp current_clean.log $LOG_FILE

# ---------------- Cleanup ----------------
rm current_devices.log current_clean.log

echo "[INFO] Scan complete."


