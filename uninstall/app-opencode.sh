#!/bin/bash

sudo rm -rf /usr/bin/OpenCode
rm -rf ~/.local/share/ai.opencode.desktop
rm -rf ~/.config/ai.opencode.desktop
sudo apt remove --purge -y open-code
