#!/bin/bash

cd /tmp
wget https://opencode.ai/download/stable/linux-x64-deb -O opencode.deb
sudo apt install ./opencode.deb -y
rm opencode.deb
cd -
