#!/usr/bin/env bash
echo "Welcome to the AMS installer for Linux!"
echo "This will install AMS in your home directory at ~"
echo "Press Enter to install AMS."
read
clear
cd ~
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
bash ams-temp.sh
curl https://amsilla-ams.pages.dev/ams-app.py >> ams-app.py
rm ams-temp.sh
apt install python3.13-venv
python3 -m venv venv
source venv/bin/activate
pip install requests
read
clear
echo "Installation is now complete. To open AMS, type 'ams' into the terminal."
