#!/bin/bash
###
# Script that should setup my new mac
###

# Install homebrew
echo "Installing homebrew, might take some time"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing homebrew cask"
brew tap caskroom/cask
brew tap d12frosted/emacs-plus

# installing few basics
brew install zsh zsh-completions wget shellcheck kubectl awscli emacs-plus z sshuttle watch zsh-syntax-highlighting tree
brew linkapps emacs-plus

# installing all programs that I need
brew cask install google-chrome \
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
  keybase \
  grammarly \
  kindle \
  linkliar \
  jaxx

# Setup Iterm2 config loading
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# install some extra fonts
brew tap caskroom/fonts
brew cask install font-source-code-pro

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install zsh-nvm plugin to manage nvm
# to make this work, you must add 'zsh-nvm' to plugins in .zshrc
git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm

# install autosuggestion zsh plugin
# add zsh-autosuggestions to plugins in .zshrc
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

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

ln -sf "/Users/${USER}/dotfiles/gpg.conf" "/Users/${USER}/.gnupg/gpg.conf"
ln -sf "/Users/${USER}/dotfiles/gpg-agent.conf" "/Users/${USER}/.gnupg/gpg-agent.conf"

# install azure cli tools
curl -L https://aka.ms/InstallAzureCli | bash

# install GPG signing for git
brew install gnupg gpg-agent pinentry-mac

# setup GPG signing for git from here:
open https://github.com/pstadler/keybase-gpg-github
