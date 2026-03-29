#!/bin/bash

sudo add-apt-repository universe -y
sudo add-apt-repository ppa:agornostal/ulauncher -y
sudo apt update
sudo apt install ulauncher -y

# Start ulauncher to have it populate config before we overwrite
mkdir -p ~/.config/autostart/
cp ~/.local/share/omakub/configs/ulauncher.desktop ~/.config/autostart/ulauncher.desktop
gtk-launch ulauncher.desktop >/dev/null 2>&1
sleep 2 # ensure enough time for ulauncher to set defaults
cp ~/.local/share/omakub/configs/ulauncher.json ~/.config/ulauncher/settings.json

# cd ~/.local/share/ulauncher/extensions

# pip3 install requests pint simpleeval parsedatetime
# git clone https://github.com/tchar/ulauncher-albert-calculate-anything

# git clone https://github.com/Ulauncher/ulauncher-emoji
# # TODO: Install copyq
# git clone https://github.com/friday/ulauncher-clipboard
# git clone https://github.com/melianmiko/ulauncher-bluetoothd
# git clone https://github.com/iboyperson/ulauncher-system
# git clone https://github.com/hillaryychan/ulauncher-fzf
# git clone https://github.com/brpaz/ulauncher-file-search
# git clone https://github.com/manahter/ulauncher-translate
# git clone https://github.com/ulauncher/ulauncher-timer
# git clone https://github.com/brpaz/ulauncher-vscode-projects
# git clone https://github.com/brpaz/ulauncher-github
# git clone https://github.com/isacikgoz/ukill
# git clone https://github.com/fisadev/ulauncher-better-file-browser
# git clone https://github.com/friday/ulauncher-gnome-settings
# git clone https://github.com/NastuzziSamy/ulauncher-youtube-search
# git clone https://github.com/KuenzelIT/ulauncher-firefox-bookmarks
# git clone https://github.com/melianmiko/ulauncher-nmcli
# git clone https://github.com/DevKleber/ulauncher-open-link
# git clone https://github.com/Glovecc/ulauncher-github-search
# git clone https://github.com/safaariman/ulauncher-jira
