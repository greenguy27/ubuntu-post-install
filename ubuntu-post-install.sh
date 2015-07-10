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

# Ending script
echo -e $GREEN
echo "#########################################################################"
echo -e $NORMAL
