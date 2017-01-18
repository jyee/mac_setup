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

brew cask install atom
brew cask install android-file-transfer
brew cask install avibrazil-rdm
brew cask install cloak
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install google-drive
brew cask install minikube
brew cask install nvalt
brew cask install spotify
brew cask install transmission
brew cask install virtualbox
brew cask install vlc

echo "======>>>>>> Installing homebrew packages..."
brew install python
pip install --upgrade pip setuptools
pip install virtualenv
brew install ruby
brew install rbenv
rbenv init
brew install hugo
brew install heroku
brew install certbot

iecho "======>>>>>> Installing Keybase & Keybase FS..."
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

echo "======>>>>>> Installing Datadog..."
read -p "Enter your Datadog API key: " APIKEY
DD_API_KEY=$APIKEY bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/osx/install.sh)"
datadog-agent stop

echo "Remember to install Pertino! Opening download page for you now..."
open -a "Google Chrome.app" https://cradlepoint.com/downloads
