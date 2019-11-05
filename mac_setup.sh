#!/bin/bash

echo "======>>>>>> Installing homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "======>>>>>> Installing mas..."
brew install mas

mas install 986304488 # Kiwi for Gmail
mas install 803453959 # Slack
mas install 425424353 # The Unarchiver
mas install 497799835 # XCode
mas install 409183694 # Keynote

echo "======>>>>>> Installing cask..."
brew tap caskroom/cask

brew cask install aerial
brew cask install atom
brew cask install avibrazil-rdm
brew cask install cloak
brew cask install discord
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install imageoptim
brew cask install ipvanish-vpn
brew cask install nvalt
brew cask install spotify
brew cask install transmission
brew cask install virtualbox
brew cask install vlc

echo "======>>>>>> Installing homebrew packages..."
brew install coreutils
brew install pyenv
brew install rbenv
brew install go
brew install hugo
brew install kubectl
brew install kubernetes-helm
brew install minikube
brew install wget

read -p "Install Public Cloud Tools? (y/n)" PUBCLOUD
if [ "$PUBCLOUD" = "y" ]; then
  brew install aws-cli
  brew cask install google-cloud-sdk
  brew install heroku
  brew install ibm-cloud-cli
fi

echo "======>>>>>> Installing Keybase & Keybase FS..."
brew install keybase
brew cask install keybase # Install Keybase file system
keybase login
open /Applications/Keybase.app
read -p "Copy sensitive files from Keybase private store? (y/n)" COPYSENSITIVE
if [ "$COPYSENSITIVE" = "y" ]; then
  cp -R /keybase/private/jyee/.ssh ~/.ssh
  cp /keybase/private/jyee/.bash_profile ~/.bash_profile
fi

echo "======>>>>>> Copying non-sensitive files from Github repo..."
SRCDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -R $SRCDIR/user_config/ ~/

# Finish PyEnv installation
echo -e '\n#Pyenv Shim\nif command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.bash_profile
source ~/.bash_profile
# These are currently supported by Heroku, so I want them for testing.
pyenv install 2.7.15
pyenv install 3.6.6
pyenv install 3.7.0

# Finish RvEnv installation. Install Heroku supported versions.
rbenv init
rbenv install 2.3.8
rbenv install 2.4.5
rbenv install 2.5.3
