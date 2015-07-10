#!/bin/bash

# Verification of root
if [ ! $USER = root ]; then
  echo "You have to be root to execute this program !"
  exit
fi

# Setting Colors
NORMAL="\033[39m"
GREEN="\033[32m"

# Presenting script
echo -e $GREEN
echo "#########################################################################"
echo "# Ubuntu Post installation script                                       #"
echo "#########################################################################"
echo -e $NORMAL

# Adding repositories
echo -e "$GREEN Adding repositories $NORMAL"

# Updating
echo -e "$GREEN Updating system $NORMAL"
apt-get update
apt-get upgrade -y

# Installing new softwares
echo -e "$GREEN Installing softwares $NORMAL"
apt-get install -y sl
apt-get install -y vim
apt-get install -y terminator
apt-get install -y unity-tweak-tool
apt-get install -y docker.io
apt-get install -y zsh

# Configuring softwares
echo -e "$GREEN Configuring softwares $NORMAL"
echo "ZSH"
chsh root -s /bin/zsh

# Ending script
echo -e $GREEN
echo "#########################################################################"
echo -e $NORMAL
