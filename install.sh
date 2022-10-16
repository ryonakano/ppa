#!/bin/bash
set -eu

# prerequirements
sudo apt install -y curl

# install priority file
sudo curl -o /etc/apt/preferences.d/ryonakano-patches.pref "https://ryonakano.github.io/ppa/ryonakano-patch.pref"

# install PPA
curl -s --compressed "https://ryonakano.github.io/ppa/debian/KEY.gpg" | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/ryonakano_ppa.gpg >/dev/null
echo "deb [signed-by=/etc/apt/trusted.gpg.d/ryonakano_ppa.gpg] https://ryonakano.github.io/ppa/debian ./" | sudo tee /etc/apt/sources.list.d/ryonakano_ppa.list

# upgrade only the target package
sudo apt update
sudo apt install base-files
