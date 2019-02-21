#!/bin/bash
chmod +x ./ftp/install.sh
./ftp/install.sh
apt-get -y install wget screen git
git clone https://github.com/teddysun/lamp.git
cd lamp
chmod 755 *.sh
screen -S lamp
./lamp.sh