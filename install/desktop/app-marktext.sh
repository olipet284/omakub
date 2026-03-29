#!bin/bash

cd /tmp
wget -O marktext.deb "https://github.com/marktext/marktext/releases/download/v0.17.1/marktext-amd64.deb"
sudo apt install -y ./marktext.deb
rm marktext.deb
cd -
