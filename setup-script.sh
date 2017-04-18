#!/bin/bash
###
# Script that should setup my new mac
###

# Install homebrew
echo "Installing homebrew, might take some time"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing homebrew cask"
brew tap caskroom/cask

# installing few basics
brew install zsh zsh-completions wget shellcheck kubectl awscli emacs-plus z
brew linkapps emacs-plus

# installing all programs that I need
brew install google-chrome \
  iterm2 \
  docker \
  1password \
  spectacle \
  scroll-reverser \
  caffeine \
  virtualbox \
  spotify \
  dropbox \
  polymail \
  sublime-text \
  slack \
  vlc \
  amazon-drive \
  time-lapse-assembler \
  keybase

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# clone my dot settings from github
git clone https://github.com/maticko/dotfiles.git

# install zaw
git clone git://github.com/zsh-users/zaw.git
mkdir .tools
mv zaw .tools

# install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# link .zshrc from dotfiles
ln -sf "/Users/${USER}/dotfiles/.zshrc" "/Users/${USER}/.zshrc"

# link .spacemacs from dotfiles
ln -sf "/Users/${USER}/dotfiles/.spacemacs" "/Users/${USER}/.spacemacs"

# link global git settings and gitignore
ln -sf "/Users/${USER}/dotfiles/.gitconfig" "/Users/${USER}/.gitconfig"
ln -sf "/Users/${USER}/dotfiles/.gitignore_global" "/Users/${USER}/.gitignore_global"

# install azure cli tools
curl -L https://aka.ms/InstallAzureCli | bash

## TODO: Install gpg signatures
# install GPG signing for git
#brew install gnupg gpg-agent pinentry-mac
#echo "install keybase app from web :/"
