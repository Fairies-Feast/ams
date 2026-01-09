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

ORIG_USER=${SUDO_USER:-$(whoami)}

run_user() {
  sudo -u "$ORIG_USER" "$@"
}

rm ams-app.py
unalias ams
#echo "alias ams='cd ~ && python3 ams-app.py'" >> "$HOME/.bashrc";
run_user printf "%s\n" "alias ams='cd ~ && python3 ams-app.py'" >> "$HOME/.bashrc"
run_user source ~/.bashrc
curl https://amsilla-ams.pages.dev/ams-app.py >> ams-app.py
apt install python3.13-venv
python3 -m venv venv
source venv/bin/activate
pip install requests
clear
echo "Installation is now complete. To open AMS, type 'ams' into the terminal."
