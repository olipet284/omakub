#!/bin/bash

# Install dependencies
sudo apt -y install protobuf-compiler libdbus-1-dev libasound2-dev libopus0 libopus-dev

cargo install termusic termusic-server --locked
