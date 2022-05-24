#!/bin/bash 


#Packages
sudo apt-get update -y
sudo apt-get install terminator git vim python3 python3-pip exa -y
sudo apt-get install i3 i3lock -y
sudo apt-get install nitrogen rofi -y
sudo apt-get install exa wget tmux -y
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
wget https://raw.githubusercontent.com/jurdunnn/tmux-config/main/tmux.conf
sudo mv tmux.conf /etc
rm -r tmux.conf
#pwncat 
sudo docker build -t pwncat $REPO/pwncat/
#pwncat config
cat << EOF >> /tmp/pwncatrc
set -g lhost "127.0.0.1"
set -g prefix c-k
set -g privkey "data/pwncat"
set -g backdoor_user "pwncat"
set -g backdoor_pass "pwncat"
set -g db "file://db/pwncat"
set -g on_load {
        privesc -l
}
bind s "sync"
bind c "set state command"
alias up upload
alias down download
shortcut ! local
shortcut @ run
EOF
mv /tmp/pwncatrc $REPO/pwncat/pwncatrc
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


cat << EOF >> /tmp/config
[global_config]
  window_state = fullscreen
  scroll_tabbar = True
  homogeneous_tabbar = False
  title_transmit_bg_color = "#000000"
  title_receive_bg_color = "#d41919"
  title_inactive_fg_color = "#ffffff"
  title_inactive_bg_color = "#000000"
  enabled_plugins = LaunchpadBugURLHandler, LaunchpadCodeURLHandler, APTURLHandler, Logger
[keybindings]
  next_tab = <Alt>a
  prev_tab = <Alt>s
[profiles]
  [[default]]
    background_darkness = 0.96
    background_type = transparent
    cursor_color = "#0bff2b"
    cursor_color_fg = False
    font = Fira Code Semi-Bold 13
    foreground_color = "#0bff2b"
    show_titlebar = False
    scrollbar_position = hidden
    scrollback_infinite = True
    palette = "#073642:#dc322f:#859900:#b58900:#268bd2:#d33682:#2aa198:#eee8d5:#002b36:#cb4b16:#586e75:#657b83:#839496:#6c71c4:#93a1a1:#fdf6e3"
    bold_is_bright = True
[layouts]
  [[default]]
    [[[window0]]]
      type = Window
      parent = ""
    [[[child1]]]
      type = Terminal
      parent = window0
[plugins]
EOF 
mv /tmp/config $HOME/.config/terminator/
