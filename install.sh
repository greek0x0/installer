#!/bin/bash 


#Packages
sudo apt-get update -y
sudo apt-get install git vim i3 python3 -y
python3 install pip
sudo pip install keep #needs to run as sudo

#Repo get
GIT=https://github.com/greek0x0
mkdir $HOME/Repo
REPO=$HOME/Repo
git clone $GIT/vimrc $REPO
git clone $GIT/dits $REPO
git clone $GIT/aliasrc $REPO
git clone $GIT/ammo $REPO
git clone $GIT/x86-64-assembly $REPO
git clone $GIT/x86_64-basic-bootsector $REPO





# Exploits 







# Payloads




#Configuration 
chmod +x $REPO/vimrc/setup.sh
sh $REPO/vimrc/setup.sh
chmod +x $REPO/dots/setup.sh
sh $REPO/dots/setup.sh

