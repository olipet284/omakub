#!/bin/bash

cd /tmp
git clone https://github.com/SallingGroup-AI-and-ML/venv-cli
cd venv-cli
cp ~/.bashrc ~/.bashrc.tmp
./install.sh
cd /tmp
rm -rf venv-cli
cp ~/.bashrc.tmp ~/.bashrc
rm ~/.bashrc.tmp
