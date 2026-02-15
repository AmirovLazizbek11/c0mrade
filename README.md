# ☠️ c0mrade — Advanced C2 Framework

![GitHub language](https://img.shields.io/badge/Version-2.5-00ff9d?style=for-the-badge&logo=hackthebox&logoColor=white)
![GitHub language](https://img.shields.io/badge/Platform-Windows-0078D4?style=for-the-badge&logo=windows&logoColor=white)
![GitHub language](https://img.shields.io/badge/Agent-C++-00599C?style=for-the-badge&logo=cplusplus&logoColor=white)
![GitHub language](https://img.shields.io/badge/Server-Python-3776AB?style=for-the-badge&logo=python&logoColor=white)

```
       /$$$$$$                                         /$$ 
      /$$$_  $$                                       | $$          
  /$$$$$$$$| $$$$\ $$ /$$$$$/$$$$   /$$$$$$  /$$$$$$   /$$$$$$$  /$$$$$$
 /$$_____/| $$ $$ $$| $$_  $$_  $$ /$$__  $$|____  $$ /$$__  $$ /$$__  $$
| $$      | $$\ $$$$| $$ \ $$ \ $$| $$  \__/ /$$$$$$$| $$  | $$| $$$$$$$$
| $$      | $$ \ $$$| $$ | $$ | $$| $$      /$$__  $$| $$  | $$| $$_____/
|  $$$$$$$|  $$$$$$/| $$ | $$ | $$| $$     |  $$$$$$$|  $$$$$$$|  $$$$$$$
 \_______/ \______/ |__/ |__/ |__/|__/      \_______/ \_______/ \_______/
```

A next-generation Command & Control framework with professional-grade evasion,
encrypted communications, and a Cyberpunk-themed real-time web dashboard.

<p align="center">
<a href="#-overview">Overview</a> •
<a href="#-core-features">Features</a> •
<a href="#-architecture">Architecture</a> •
<a href="#-installation">Installation</a> •
<a href="#-usage">Usage</a> •
<a href="#-technical-deep-dive">Technical Deep Dive</a> •
<a href="#%EF%B8%8F-disclaimer">Disclaimer</a>
</p>

---

## 🎯 Overview

**c0mrade** is a full-stack offensive security framework engineered by **Amirov Lazizbek** for authorized red team operations and security research. It combines a stealthy C++ implant with a real-time Python C2 server, all managed through an immersive Cyberpunk-style web dashboard.

> ⚠️ **EDUCATIONAL & AUTHORIZED TESTING ONLY** — This tool is designed for controlled lab environments, CTF competitions, and professional penetration testing engagements.

---

## ✨ Core Features

### 🔹 Agent — Stealth C++ Implant

| Category | Feature | Description |
|----------|---------|-------------|
| 🛡️ **Evasion** | AMSI Bypass | Patches `AmsiScanBuffer` in-memory |
| | ETW Disabling | Blinds Windows Event Tracing telemetry |
| | Ntdll Unhooking | Restores hooked system DLLs from disk |
| | Sandbox Detection | CPU cores, RAM, uptime checks |
| 💻 **Execution** | Stateful Shell | Persistent cmd.exe sessions with directory tracking |
| | PowerShell Bypass | `ps <cmd>` executes with `-ExecutionPolicy Bypass` |
| 🔒 **Comms** | XOR + Base64 | Dual-layer encrypted C2 protocol |
| | Newline Delimiter | Reliable message framing over TCP |
| 🔄 **Persistence** | Registry Run Key | Survives reboots via `HKCU\...\Run` |
| | Scheduled Tasks | Alternative persistence mechanism |
| 🥷 **Stealth** | Zero .NET | Pure Win32 API — no managed code dependencies |
| | Hidden Window | `SW_HIDE` + `CREATE_NO_WINDOW` process creation |

### 🔹 Server — Python + Flask-SocketIO

| Feature | Description |
|---------|-------------|
| 🌐 **Web Dashboard** | Cyberpunk-themed real-time interface with scanline effects |
| 👥 **Multi-Agent** | Manage unlimited concurrent agent sessions |
| ⌨️ **Interactive Shell** | Browser-based terminal with command history (↑/↓ arrows) |
| 📡 **WebSocket** | Real-time bidirectional updates via Socket.IO |
| 🌏 **Encoding Support** | CP866/UTF-8 auto-detection for Windows localized output |
| 📂 **Session Tracking** | Per-agent command history and CWD synchronization |

---

## 🏗️ Architecture

```
┌────────────────────────────────────────────────────────────────┐
│                       c0mrade v2.5                             │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  ┌──────────┐    XOR+B64/TCP    ┌──────────────┐   Socket.IO  │
│  │  AGENT   │ ◄═══════════════► │  C2 SERVER   │ ◄══════════► │  🖥️ WEB UI
│  │  (C++)   │    Port 4444      │  (Python)    │   Port 2727  │  (Browser)
│  └──────────┘                   └──────────────┘              │
│       │                              │                         │
│  ┌────┴────┐                    ┌────┴────┐                   │
│  │ AMSI    │                    │ Flask   │                   │
│  │ ETW     │                    │ SocketIO│                   │
│  │ Unhook  │                    │ Thread  │                   │
│  │ Sandbox │                    │ Manager │                   │
│  └─────────┘                    └─────────┘                   │
└────────────────────────────────────────────────────────────────┘
```

---

## 📁 Project Structure

```
c0mrade/
├── 📄 c2_server.py              # C2 Master Server (Flask + SocketIO)
├── 📄 quick.sh                  # One-click automated setup
├── 📄 agent_builder.sh          # Agent compilation script
├── 📂 src/
│   ├── main.cpp                 # Agent core logic & reverse shell
│   ├── evasion/
│   │   ├── etw_bypass.cpp       # Event Tracing bypass
│   │   ├── sandbox_detect.cpp   # VM/Sandbox detection
│   │   └── unhook.cpp           # Ntdll restoration
│   ├── execution/
│   │   ├── process_hollow.cpp   # Process hollowing
│   │   └── shell.cpp            # Command execution engine
│   ├── network/
│   │   ├── connection.cpp       # C2 connectivity
│   │   └── encryption.cpp       # XOR + Base64 protocol
│   ├── persistence/
│   │   ├── registry.cpp         # Registry-based persistence
│   │   └── schtasks.cpp         # Scheduled task persistence
│   └── utils/
│       ├── helpers.cpp          # Utility functions
│       └── obfuscation.cpp      # String obfuscation
├── 📂 include/
│   └── common.h                 # Shared headers & config
├── 📂 templates/
│   └── index.html               # c0mrade Web Dashboard
└── 📄 README.md
```

---

## ⚡ Installation

### Prerequisites

- **Linux/macOS (Server):** Python 3.8+, MinGW-w64 (for cross-compilation)
- **Windows (Target):** Windows 7/8/10/11

### Quick Setup

```bash
# Clone the repository
git clone https://github.com/AmirovLazizbek11/c0mrade.git
cd c0mrade

# Run automated setup (installs dependencies + compiles agent)
chmod +x quick.sh
./quick.sh
```

The setup script will prompt for:

| Parameter | Default | Description |
|-----------|---------|-------------|
| `C2_IP` | Your IP | Your server IP address |
| `C2_PORT` | 4444 | Agent communication port |
| `WEB_PORT` | 2727 | Web dashboard port |
| `PAYLOAD_NAME` | Agent.exe | Custom payload filename |
| `ICON_PATH` | (optional) | Custom icon for the payload |

---

## 🎮 Usage

### Phase 1 — Launch Server

```bash
python3 c2_server.py
```

### Phase 2 — Deploy Agent

Transfer the compiled `.exe` to the Windows target and execute. The agent connects back silently.

### Phase 3 — Command & Control

Open the web dashboard (`http://localhost:2727`) and interact through the terminal:

| Command | Description |
|---------|-------------|
| `sysinfo` | Retrieve detailed host telemetry |
| `persist` | Install registry-based persistence |
| `ps <cmd>` | Execute PowerShell with bypass |
| `cd <path>` | Navigate remote filesystem |
| `dir` / `ls` | List directory contents |
| `whoami` | Current user identity |
| `help` | Show all available commands |
| `clear` | Clear terminal buffer |
| `history` | View command history |
| `exit` | Terminate agent session |

---

## 🔬 Technical Deep Dive

### 🔐 Communication Protocol

```
[Agent] ──► XOR(key=0x42) ──► Base64Encode ──► TCP + '\n' ──► [Server]
[Server] ──► XOR(key=0x42) ──► Base64Encode ──► TCP + '\n' ──► [Agent]
```

### 🛡️ AMSI Bypass

Patches `AmsiScanBuffer` at runtime to return `AMSI_RESULT_NOT_DETECTED`:

```cpp
BYTE patch[] = { 0xB8, 0x57, 0x00, 0x07, 0x80, 0xC3 };
// mov eax, 0x80070057 (E_INVALIDARG) ; ret
```

### 🕵️ Sandbox Evasion

Multi-layer environment fingerprinting:

- **Hardware:** CPU cores < 2, RAM < 4GB
- **Behavioral:** Uptime < 10 minutes detection
- **Process Analysis:** Multiple detection vectors combined

### 🔄 Persistence Mechanism

```cpp
RegSetValueExA(hKey, "WindowsUpdate", 0, REG_SZ, 
               (BYTE*)path, strlen(path));
// HKCU\Software\Microsoft\Windows\CurrentVersion\Run
```

### 🔓 Ntdll Unhooking

Restores the `.text` section of ntdll.dll from a fresh copy on disk to remove EDR hooks:

```cpp
// Map clean ntdll.dll from System32
// Overwrite hooked .text section with original bytes
```

---

## 🎓 Educational Value

This project demonstrates advanced concepts in:

- 🧠 **Windows Internals** — Direct Win32 API system interaction
- 🔐 **Cryptographic Protocols** — Custom encrypted communication design
- 🛡️ **Defense Evasion** — Understanding AV/EDR bypass techniques
- 🌐 **Full-Stack Engineering** — C++ agent + Python server + Web frontend
- 🔬 **Memory Manipulation** — Runtime patching and DLL unhooking

---

## 🛡️ Detection & Defense

| Technique | Mitigation |
|-----------|------------|
| AMSI Bypass | Enable tamper protection, integrity monitoring |
| ETW Disabling | Deploy kernel-level ETW consumers |
| Registry Persistence | Monitor Run key modifications |
| C2 Traffic | Network segmentation, egress filtering, TLS inspection |
| Memory Patching | Deploy EDR with memory scanning capabilities |

---

## ⚠️ Legal Disclaimer

> **FOR EDUCATIONAL & AUTHORIZED SECURITY TESTING ONLY**

✅ **Permitted Use:**
- Authorized penetration testing engagements
- Personal lab environments & virtual machines
- Academic security research & CTF competitions
- Red/Blue team training exercises

❌ **Prohibited:**
- Unauthorized access to any system
- Malicious activities or service disruption
- Data exfiltration or surveillance
- Any violation of applicable laws

**The author (Amirov Lazizbek) assumes NO LIABILITY for misuse. Users bear full legal responsibility for their actions.**

---

### 👤 Developer

**Amirov Lazizbek**

[![Telegram](https://img.shields.io/badge/Telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white)](https://t.me/Cyber_forcee)
[![GitHub](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/AmirovLazizbek11)

> ⚠️ **Use this knowledge to defend, not to attack.**

---

<p align="center">
© 2026 Amirov Lazizbek — c0mrade Project
</p>
