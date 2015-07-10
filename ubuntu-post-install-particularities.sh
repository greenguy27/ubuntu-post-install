#!/bin/bash

# Verification of root
if [ ! $USER = root ]; then
  echo "You have to be root to execute this program !"
  exit
fi

# Configuring ZSH for user lerenn
echo "ZSH"
chsh lerenn -s /bin/zsh
