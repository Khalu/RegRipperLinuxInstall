#!/bin/bash
# Author: Khalu
# based on instructions from https://blog.dfir.fi/tools/2020/02/19/install-regripper.html

echo "RegRipper2.8 Linux install helper script"

function regget {
sudo apt-get update && sudo apt-get install -y cpanminus git
sudo cpanm Parse::Win32Registry --force
git clone https://github.com/keydet89/RegRipper2.8.git
}

function mod {
modfile=$( find ./ -name RipMod.sh )
regripdir=$( find ./ -name RegRipper2.8)
cp $modfile $regripdir
cd $regripdir
./RipMod.sh
}

regget
mod
