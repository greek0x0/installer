#!/bin/bash 


#Packages
sudo apt-get update -y
sudo apt-get install terminator git vim python3 python3-pip exa -y
sudo apt-get install i3 i3lock -y
sudo apt-get install nitrogen rofi -y
sudo apt-get install exa
sudo pip install keep
sudo apt-get install seclists -y
sudo apt install -y docker.io
sudo systemctl enable docker --now
sudo usermod -aG docker $USER

#Repo get
GIT=https://github.com/greek0x0
mkdir $HOME/Repo
REPO=$HOME/Repo
git clone $GIT/vimrc $REPO/vimrc
git clone $GIT/dots $REPO/dots
git clone $GIT/aliasrc $REPO/aliasrc
git clone $GIT/ammo $REPO/ammo
git clone $GIT/x86-64-assembly $REPO/x86-64-assembly
git clone $GIT/x86_64-basic-bootsector $REPO/x86_64-basic-bootsector

# Other repos 
git clone https://github.com/calebstewart/pwncat $REPO/pwncat



# Exploits 
mkdir $HOME/exploits
mkdir $HOME/exploits/windows
mkdir $HOME/exploits/linux


#PrivEsc
mkdir $HOME/privesec


# Payloads
mkdir $HOME/payloads
mkdir $HOME/payloads/windows
mkdir $HOME/payloads/linux




#Configuration 
chmod +x $REPO/vimrc/setup.sh
sh $REPO/vimrc/setup.sh
chmod +x $REPO/dots/setup.sh
sh $REPO/dots/setup.sh
chmod +x $REPO/aliasrc/setup.sh
sh $REPO/aliasrc/setup.sh
mkdir $HOME/.keep
cp $REPO/ammo/commands.json $HOME/.keep/
