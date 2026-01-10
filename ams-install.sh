#!/usr/bin/env bash
echo "Welcome to the AMS installer for Linux!"
echo "This will install AMS in your home directory at ~"
echo "Press Enter to install AMS."
read
clear
cd "$(eval echo "~$SUDO_USER")"
if command -v apt >/dev/null; then
    apt update
    apt install -y python3 curl

elif command -v dnf >/dev/null; then
    dnf install -y python3 curl

elif command -v pacman >/dev/null; then
    pacman -Sy --noconfirm python curl

elif command -v zypper >/dev/null; then
    zypper install -y python3 curl

elif command -v apk >/dev/null; then
    apk add python3 curl

else
    echo "Unsupported package manager"
    echo "Please get help at amsilla-ams.pages.dev."
    exit 1
fi
rm ams-app.py
rm ams-temp.sh
unalias ams

curl https://amsilla-ams.pages.dev/ams-temp.sh >> ams-temp.sh
curl https://amsilla-ams.pages.dev/ams-app.py >> ams-app.py
apt install -y python3.13-venv
python3 -m venv venv
source venv/bin/activate
pip install requests
clear
echo "Installation is almost done. Please copy-paste these commands:"
echo ""
echo ""
cat ams-temp.sh
echo ""
echo ""
echo "Once you have done that, type 'ams' into the shell to open AMS!"
rm ams-temp.sh
echo "Please also remove ams-install.sh file."
echo "Uninstall instructions: https://amsilla-ams.pages.dev"
