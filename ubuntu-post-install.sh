#!/bin/bash

# Variables
MAIN_USER=lerenn

# Verification of root
if [ ! $USER = root ]; then
  echo "You have to be root to execute this program !"
  exit
fi

# Go in the script directory
cd $( cd -P -- "$(dirname -- "$(command -v -- "$0")")" && pwd -P )

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
add-apt-repository ppa:webupd8team/popcorntime -y # Popcorn time
sh -c 'echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list' # Spotify Repo
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys D2C19886 -y # Spotify Key

# Updating
echo -e "$GREEN Updating system $NORMAL"
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y

# Installing new softwares
echo -e "$GREEN Installing software through apt-get $NORMAL"
apt-get install -y sl
apt-get install -y vim
apt-get install -y terminator
apt-get install -y unity-tweak-tool
apt-get install -y docker.io
apt-get install -y zsh
apt-get install -y python-pip
apt-get install -y qtcreator
apt-get install -y golang
apt-get install -y atom
apt-get install -y spotify-client
apt-get install -y popcorn-time
apt-get install -y steam
apt-get install -y playonlinux

# Installing particular software
echo -e "$GREEN Installing particular software $NORMAL"
wget http://mir7.ovh.net/ovh-applications/hubic/hubiC-Linux/2.1.0/hubiC-Linux-2.1.0.53-linux.deb -P /tmp/
dpkg -i /tmp/hubiC-Linux-2.1.0.53-linux.deb

# Configuring softwares
echo -e "$GREEN Configuring software $NORMAL"
echo "ZSH"
wget http://formation-debian.via.ecp.fr/fichiers-config/zshrc
wget http://formation-debian.via.ecp.fr/fichiers-config/zshenv
wget http://formation-debian.via.ecp.fr/fichiers-config/zlogin
wget http://formation-debian.via.ecp.fr/fichiers-config/zlogout
wget http://formation-debian.via.ecp.fr/fichiers-config/dir_colors
mv zshrc zshenv zlogin zlogout /etc/zsh/
mv dir_colors /etc/
chsh root -s /bin/zsh
chsh lerenn -s /bin/zsh
echo "Spotify"
# Adding missing libgcrypt11
wget http://security.ubuntu.com/ubuntu/pool/main/libg/libgcrypt11/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb -P /tmp/
dpkg -i /tmp/libgcrypt11_1.5.3-2ubuntu4.2_amd64.deb

# Installing personal software
echo -e "$GREEN Installing personal software $NORMAL"
git clone https://github.com/Lerenn/debian-personal-commands.git /tmp/scripts
/tmp/scripts/script-installer.sh

# Installing personal themes
echo -e "$GREEN Installing personal themes $NORMAL"
wget http://download1975.mediafire.com/1ailurmvwemg/frmn82hka2n0s8w/myelementary.tar.gz -P /tmp/
tar -xzf /tmp/myelementary.tar.gz -C /tmp/
mkdir /home/$MAIN_USER/.icons
mv /tmp/myelementary /home/$MAIN_USER/.icons/
chown -R $MAIN_USER:$MAIN_USER /home/$MAIN_USER/.icons
unzip -qq ./data/StylishDark-wps.zip -d /tmp/
mkdir /home/$MAIN_USER/.themes
mv /tmp/StylishDark-wps /home/$MAIN_USER/.themes
chown -R $MAIN_USER:$MAIN_USER /home/$MAIN_USER/.themes

# Cleaning
echo -e "$GREEN Cleaning $NORMAL"
apt-get autoremove -y
apt-get clean -y

# Ending script
echo -e $GREEN
echo "#########################################################################"
echo -e $NORMAL
echo "What you have to do now :"
echo " - Change theme"
echo " - Configure Hubic"
echo " - Reboot the system"
echo -e $GREEN
echo "#########################################################################"
echo -e $NORMAL
