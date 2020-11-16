#!/usr/bin/env bash

./check-dependencies.sh

# setup Xorg
rm -f $HOME/.xprofile
ln -sf $PWD/xorg/xprofile $HOME/.xprofile
rm -f $HOME/.xinitrc
ln -sf $PWD/xorg/xinitrc $HOME/.xinitrc
rm -f $HOME/.xsession
ln -sf $PWD/xorg/xsession $HOME/.xsession
rm -f $HOME/.profile
ln -sf $PWD/profile $HOME/.profile

# setup Bash
mkdir -p $HOME/.config/bash
rm -f $HOME/.bashrc
ln -sf $PWD/bash/bashrc $HOME/.bashrc
rm -f $HOME/.bash_profile 
ln -sf $PWD/bash/bash_profile $HOME/.bash_profile
rm -f $HOME/.config/bash/bash_prompt
ln -sf $PWD/bash/bash_prompt $HOME/.config/bash/bash_prompt
rm -f $HOME/.config/bash/fzf.bash
ln -sf $PWD/bash/fzf.bash $HOME/.config/bash/fzf.bash
rm -f $HOME/.config/bash/z.sh
ln -sf $PWD/bash/z.sh $HOME/.config/bash/z.sh

# setup Git
mkdir -p $HOME/.config/git
rm -f $HOME/.config/git/ignore
ln -sf $PWD/git/ignore $HOME/.config/git/ignore
rm -f $PWD/git/config $HOME/.config/git/config
ln -sf $PWD/git/config $HOME/.config/git/config

# setup Sustemd
mkdir -p $HOME/.config/systemd/user
rm -f $HOME/.config/systemd/user/emacs.service
ln -sf $PWD/systemd/emacs.service $HOME/.config/systemd/user/emacs.service
rm -f $HOME/.config/systemd/user/slstatus.service
ln -sf $PWD/systemd/slstatus.service $HOME/.config/systemd/user/slstatus.service

# setup custom scripts
ln -sf $PWD/scripts $HOME/.scripts
