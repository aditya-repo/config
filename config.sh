#!/bin/sh

# update the packages [Update Package List] 
sudo apt update
sudo apt upgrade

# step 2 [Install Dependencies]
sudo apt-get install build-essential

sudo apt-get install git-core subversion wget libjansson-dev sqlite autoconf automake libxml2-dev libncurses5-dev libtool

# step 3 [Download Asterisk]
cd /usr/src
sudo wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-20-current.tar.gz

# step 4 [Extract Asterisk]
sudo tar xvf asterisk-20-current.tar.gz

# step 5 [Compile Asterisk]
cd asterisk-20*/
sudo contrib/scripts/get_mp3_source.sh
sudo apt-get install libedit-dev
sudo apt-get install libjansson-dev
sudo ./configure
sudo make menuselect


sudo make -j2

sudo make install

sudo make samples

sudo make config

sudo ldconfig

# Create Asterisk User
sudo adduser --system --group --home /var/lib/asterisk --no-create-home --gecos "Asterisk PBX" asterisk

AST_USER="asterisk"
AST_GROUP="asterisk"

sudo usermod -a -G dialout,audio asterisk

sudo chown -R asterisk: /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk
sudo chmod -R 750 /var/{lib,log,run,spool}/asterisk /usr/lib/asterisk /etc/asterisk

sudo systemctl start asterisk
sudo systemctl enable asterisk


# Configure the firewall

sudo ufw allow 5060/udp
sudo ufw allow 10000:20000/udp
