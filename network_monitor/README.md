# 🖧 Network Device Monitor - macOS

A **Bash script** to scan your local network, discover connected devices, and monitor new devices on **macOS systems**.

---

## 📋 Description

This tool automatically:

* Detects your current network configuration
* Scans your local network (e.g., 192.168.x.x/24) for connected devices
* Shows active devices with their **IP** and **MAC addresses**
* Tracks and alerts when **new devices** join the network
* Logs device information for **historical tracking**

---

## ✨ Features

* **Auto Network Detection** – Automatically detects your network range
* **Device Discovery** – Finds devices using `ping` and `ARP`
* **New Device Alerts** – Highlights newly connected devices
* **Device Logging** – Maintains a historical log of discovered devices
* **macOS Compatible** – Optimized for macOS networking commands

---

## 🚀 Usage

### Prerequisites

* macOS system
* Bash shell (pre-installed)
* Network connectivity

### Running the Script

1. Make the script executable:

```bash
chmod +x network_monitor.sh
```

2. Run the network scan:

```bash
./network_monitor.sh
```

---

### 🔹 Sample Output

```
[INFO] Your IP: 192.168.1.105
[INFO] Scanning network 192.168.1.0/24...
Connected Devices:
192.168.1.1 aa:bb:cc:dd:ee:ff
192.168.1.100 11:22:33:44:55:66
⚡ New Device Detected: 192.168.1.150 77:88:99:aa:bb:cc
[INFO] Scan complete.
```

---

## 📁 Files

* `network_monitor.sh` – Main monitoring script
* `devices.log` – Historical log of discovered devices (**auto-generated**)

---

## 🔧 How It Works

1. **Network Detection** – Extracts your IP and network range
2. **Network Scanning** – Pings all addresses in the `/24` subnet
3. **ARP Table Analysis** – Retrieves MAC addresses using `arp -a`
4. **Device Comparison** – Compares current scan with previous results
5. **Logging** – Updates `devices.log` with current findings

---

## 📝 Technical Details

* `ping` is used for host discovery with a 1-second timeout
* `arp -a` is leveraged to retrieve MAC addresses
* `awk` and shell text utilities process and clean data
* Maintains device history in `devices.log`

---

## 🔒 Use Cases

* Home network monitoring
* Detecting unauthorized devices
* Network inventory management
* Security auditing
* IoT device tracking

---

## ⚠️ Disclaimer

This tool is designed for **legitimate network administration** purposes. Only use it on networks you **own** or have **explicit permission** to scan.

---
