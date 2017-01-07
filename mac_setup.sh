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
brew install keybase

echo "======>>>>>> Installing Datadog..."
read -p "Enter your Datadog API key: " APIKEY
DD_API_KEY=$APIKEY bash -c "$(curl -L https://raw.githubusercontent.com/DataDog/dd-agent/master/packaging/osx/install.sh)"
datadog-agent stop

echo "Remember to install Pertino! Opening download page for you now..."
open -a "Google Chrome.app" https://cradlepoint.com/downloads

echo "======>>>>>> Restoring user files from backup..."
read -p "Enter the backup disk name:" DISK
read -p "Enter this machine's name:" MACHINE

BACKUP="/Volumes/$DISK/Backups.backupdb/$MACHINE/Latest/$MACHINE/Users/jyee"
if [ -d $BACKUP/.atom ]; then
  cp -R $BACKUP/.atom ~/.atom
  echo "Copied Atom settings."
fi
if [ -f $BACKUP/.bash_profile ]; then
  cp $BACKUP/.bash_profile ~/.bash_profile
  echo "Copied bash profile."
fi
if [ -f $BACKUP/.gitconfig ]; then
  cp $BACKUP/.gitconfig ~/.gitconfig
  echo "Copied git config."
fi
if [ -f $BACKUP/.gitignore_global ]; then
  cp $BACKUP/.gitignore_global ~/.gitignore_global
  echo "Copied global git ignore."
fi
if [ -d $BACKUP/.ssh ]; then
  cp -R $BACKUP/.ssh ~/.ssh
  echo "Copied ssh config and keys."
fi
if [ -f $BACKUP/.vimrc ]; then
  cp $BACKUP/.vimrc ~/.vimrc
  echo "Copied vimrc."
fi

echo "There may be other backups you should restore. Opening the backups for you to take a look..."
open $BACKUP
