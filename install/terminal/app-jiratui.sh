#!/bin/bash

if ! command -v uv &> /dev/null; then
  source ~/.local/share/omakub/install/terminal/optional/uv.sh
fi

uv tool install jiratui
