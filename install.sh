#!/bin/bash

# Install Command-Line Tools
xcode-select --install

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install oh-my-zsh
rm -rf ~/.oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install essential libraries
brew install graphviz

# Install languages
brew install node
brew install rbenv
brew install python
brew install go
brew install elixir

# Install editors and tools
brew install vim
brew install bat
brew install tree
brew install exercism
brew install http-server

# Install ZSH plugins
brew install zsh-autosuggestions
brew install zsh-completions
brew install zsh-navigation-tools
brew install zsh-syntax-highlighting

# Enable Homebrew Casks
brew install caskroom/cask

# Install applications
brew cask install --appdir="/Applications" docker
brew cask install --appdir="/Applications" expressvpn
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="/Applications" paw
brew cask install --appdir="/Applications" postgres
brew cask install --appdir="/Applications" postico
brew cask install --appdir="/Applications" vlc
brew cask install --appdir="/Applications" spotify
brew cask install --appdir="/Applications" steam
brew cask install --appdir="/Applications" transmission

# RU
brew cask install --appdir="/Applications" zoomus

# Annata stuff
brew cask install --appdir="/Applications" dotnet
brew cask install --appdir="/Applications" yammer
brew cask install --appdir="/Applications" microsoft-teams

# Visual Studio Code Insiders
brew tap homebrew/cask-versions
brew cask install --appdir="/Applications" visual-studio-code-insiders

# Install fonts
brew tap homebrew/cask-fonts
brew cask install font-fira-code
brew cask install font-inconsolata
brew cask install font-roboto-mon
brew cask install font-input

# Set macOS defaults
# Disable annoying keyboard features
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSSpellCheckerAutomaticallyIdentifiesLanguages -bool false

# Font rendering on non-retina sucks
defaults write -g CGFontRenderingFontSmoothingDisabled -bool false
defaults write -g AppleFontSmoothing -int 1

# Automatic dark/light mode
defaults write -g AppleInterfaceStyleSwitchesAutomatically -bool true

# defaults write -g ApplePressAndHoldEnabled -bool false
defaults write com.apple.finder CreateDesktop false
# to revert all dock settings: defaults delete com.apple.dock; killall Dock
defaults write com.apple.dock mineffect -string scale
defaults write com.apple.dock tilesize -integer 48
defaults write com.apple.dock autohide-time-modifier -float 0
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -bool true

killall Dock
killall Finder

# Install global NPM packages
npm install -g ncu
npm install -g jshint

# Configure Exercism
exercism configure -w ~/Projects/exercism

# Disable non-breaking space everywhere
mkdir -p ~/Library/KeyBindings
cp DefaultKeyBinding.dict ~/Library/KeyBindings/

# Copy custom themes
cp themes/codehugger.zsh-theme ~/.oh-my-zsh/custom/themes/codehugger.zsh-theme

# Symlink dotfiles
./makesymlinks.sh

# Make compaudit happy
for f in $(compaudit);do sudo chmod -R 755 $f;done;

# Support italics in terminal
tic -o ~/.terminfo dotfiles/xterm-256color.terminfo
