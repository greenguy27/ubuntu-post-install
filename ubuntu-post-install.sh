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
sed -i "/^# deb.*partner/ s/^# //" /etc/apt/sources.list # Canonical partners
add-apt-repository ppa:webupd8team/atom -y # Atom
add-apt-repository ppa:webupd8team/popcorntime # Popcorn time
sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list' # Spotify Repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886 -y # Spotify Key

# Updating
echo -e "$GREEN Updating system $NORMAL"
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Installing new softwares
echo -e "$GREEN Installing softwares $NORMAL"
apt-get install -y sl
apt-get install -y vim
apt-get install -y terminator
apt-get install -y unity-tweak-tool
apt-get install -y docker.io
apt-get install -y zsh
apt-get install -y qtcreator
apt-get install -y atom
apt-get install -y spotify-client
apt-get install -y popcorn-time
apt-get install -y steam

# Configuring softwares
echo -e "$GREEN Configuring softwares $NORMAL"
echo "ZSH"
wget http://formation-debian.via.ecp.fr/fichiers-config/zshrc
wget http://formation-debian.via.ecp.fr/fichiers-config/zshenv
wget http://formation-debian.via.ecp.fr/fichiers-config/zlogin
wget http://formation-debian.via.ecp.fr/fichiers-config/zlogout
wget http://formation-debian.via.ecp.fr/fichiers-config/dir_colors
mv zshrc zshenv zlogin zlogout /etc/zsh/
mv dir_colors /etc/
chsh root -s /bin/zsh

# Cleaning
echo -e "$GREEN Cleaning $NORMAL"
apt-get autoremove -y
apt-get clean -y

# Ending script
echo -e $GREEN
echo "#########################################################################"
echo -e $NORMAL
