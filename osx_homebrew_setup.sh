#!/bin/bash
consoleuser="$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')"


# Checking for and installing Homebrew.
if ! which brew > /dev/null; then
  echo “Installing Homebrew...”
   sudo -Hu $consoleuser /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" </dev/null
else
   echo "Homebrew already installed."
fi


# Tapping casks for driver, versions and fonts
sudo -Hu $consoleuser /usr/local/bin/brew tap caskroom/drivers
sudo -Hu $consoleuser /usr/local/bin/brew tap caskroom/versions
sudo -Hu $consoleuser /usr/local/bin/brew tap caskroom/fonts
#brew tap varunyellina/brew-varunyellina

# Drivers
drivers=(
  logitech-unifying
)

# Install Drivers
echo "Installing drivers..."
sudo -Hu $consoleuser /usr/local/bin/brew cask install ${drivers[@]}

# Apps
apps=(
  #1password
  #adobe-acrobat-reader
  #airfoil
  #alfred
  #android-file-transfer
  #android-platform-tools
  #anvil
  #appcleaner
  #arq
  #atom
  #bartender
  caffeine
  #cakebrew
  #carbon-copy-cloner
  #codekit
  #dropbox
  #dukto
  #fantastical1
  #figma
  #flux
  #framer
  #franz
  google-backup-and-sync
  google-chrome
  #google-drive-file-stream
  #google-hangouts
  #icons8
  #imageoptim
  #insync
  #iterm2
  #kaleidoscope
  #keka
  #little-snitch
  #mailmate
  nomad
  #odrive
  #opera
  #openemu
  #origami-studio
  #paragon-ntfs
  #pdfexpert
  #postbox
  #sequel-pro
  #sketch
  #skype
  #squidman
  slack
  #sublime-text
  #tower2
  #transmission
  tunnelblick
  #visual-studio-code
  #vivaldi
  vlc
  #vmware-fusion7
  #xquartz
  #wireshark
  #utorrent
  #ynab
  #zeplin
  ### Quicklook plugins
  #suspicious-package
  #quicklookase
  #qlvideo
  #qlimagesize
  #quicklook-json
  #qlmarkdown
  #qlcolorcode
  #qlstephen
  zoomus
)

# Install apps
echo "Installing Apps..."
sudo -Hu $consoleuser /usr/local/bin/brew cask install ${apps[@]}

# Fonts
fonts=(
  #font-monoid
  #font-source-code-pro
  #font-raleway
  #font-open-sans
  #font-open-sans-condensed
  #font-montserrat
  #font-menlo-for-powerline
)

# Install Fonts
#echo "Installing Fonts..."
#sudo -Hu $consoleuser /usr/local/bin/brew cask install ${fonts[@]}