#!/bin/bash
set -eu

sudo apt install -y wget
sudo wget https://raw.githubusercontent.com/ryonakano/ppa/main/ryonakano-patch.pref -O /etc/apt/preferences.d/ryonakano-patches.pref
sudo apt update
sudo apt install base-files
