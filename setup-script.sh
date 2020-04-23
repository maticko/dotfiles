#!/bin/bash
###
# Script that should setup my new mac
###

# before running
# ssh bitbucket.com
# ssh github.com

# Install homebrew
echo "Installing homebrew, might take some time"
 /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# brew tap d12frosted/emacs-plus
brew tap johanhaleby/kubetail
brew tap aws/tap

# installing few basics
brew install \
  coreutils \
  zsh \
  zsh-completions \
  wget \
  shellcheck \
  kubectl \
  awscli \
  aws-sam-cli \
  aws-iam-authenticator \
  azure-cli \
  helm \
  z \
  sshuttle \
  watch \
  zsh-syntax-highlighting \
  tree \
  tldr \
  kubetail \
  kubectx \
  derailed/k9s/k9s \
  kube-ps1 \
  derailed/popeye/popeye \
  stern \
  vim \
  git \
  openssh \
  diff-so-fancy \
  exa \
  bat \
  highlight \
  fzf \
  hub \
  repo \
  htop \
  prettyping \
  the_silver_searcher



# extending os quick-look
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package quicklookase qlvideo

# make it work in catalina
xattr -d -r com.apple.quarantine ~/Library/QuickLook
  
# brew linkapps emacs-plus

# installing all programs that I need
brew cask install google-chrome \
  firefox \
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
  slack \
  vlc \
  keybase \
  grammarly \
  kindle \
  linkliar \
  jaxx-liberty \
  drawio \
  visual-studio-code \
  postman \
  zoomus \
  android-file-transfer \
  tunnelblick \
  brave-browser \
  robo-3t 
  
# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Set sidebar icon size to small
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Set a blazingly fast keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `Nlsv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Use plain text mode for new TextEdit documents
defaults write com.apple.TextEdit RichText -int 0

# Setup Iterm2 config loading
# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# install some extra fonts
brew tap homebrew/cask-fonts
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
# git clone https://github.com/maticko/dotfiles.git

# install zaw
git clone git://github.com/zsh-users/zaw.git
mkdir .tools
mv zaw .tools

# install spacemacs
# git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

# link .zshrc from dotfiles
ln -sf "/Users/${USER}/dotfiles/.zshrc" "/Users/${USER}/.zshrc"

# link .spacemacs from dotfiles
# ln -sf "/Users/${USER}/dotfiles/.spacemacs" "/Users/${USER}/.spacemacs"

# link global git settings and gitignore
ln -sf "/Users/${USER}/dotfiles/.gitconfig" "/Users/${USER}/.gitconfig"
ln -sf "/Users/${USER}/dotfiles/.gitignore_global" "/Users/${USER}/.gitignore_global"

ln -sf "/Users/${USER}/dotfiles/gpg.conf" "/Users/${USER}/.gnupg/gpg.conf"
ln -sf "/Users/${USER}/dotfiles/gpg-agent.conf" "/Users/${USER}/.gnupg/gpg-agent.conf"

nvm install 12
nvm alias default 12
nvm use 12

npm install -g expo-cli wscat react-devtools 

brew install yarn 

# install GPG signing for git
brew install gnupg pinentry-mac

# setup GPG signing for git from here:
open https://github.com/pstadler/keybase-gpg-github
