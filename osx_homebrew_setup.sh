#!/bin/bash



# Checking for and installing Homebrew.
#if ! which brew > /dev/null; then
    #  echo “Installing Homebrew...”
   #   /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  #else
 #   echo "Homebrew already installed."
#fi

which -s brew
if [[ $? = 1 ]];
then
    # Install Homebrew. This doesn't like being run as root so we must do this manually.
    notify "Downloading Homebrew"

    # Curl down the latest tarball and install to /usr/local
    curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C /usr/local 2>&1 | tee -a ${LOG}

    # Manually make all the appropriate directories and set permissions
    mkdir -p /usr/local/Cellar /usr/local/Homebrew /usr/local/Frameworks /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/opt /usr/local/sbin /usr/local/share /usr/local/share/zsh /usr/local/share/zsh/site-functions /usr/local/var
    chown -R $consoleuser /usr/local
    chmod g+rwx /usr/local/Cellar /usr/local/Homebrew /usr/local/Frameworks /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/opt /usr/local/sbin /usr/local/share /usr/local/share/zsh /usr/local/share/zsh/site-functions /usr/local/var
    chmod 755 /usr/local/share/zsh /usr/local/share/zsh/site-functions
    chgrp admin /usr/local/Cellar /usr/local/Homebrew /usr/local/Frameworks /usr/local/bin /usr/local/etc /usr/local/include /usr/local/lib /usr/local/opt /usr/local/sbin /usr/local/share /usr/local/share/zsh /usr/local/share/zsh/site-functions /usr/local/var

    # Create a system wide cache folder
    mkdir -p /Library/Caches/Homebrew
    chmod g+rwx /Library/Caches/Homebrew
    chown $consoleuser /Library/Caches/Homebrew

    # Remove temporary folder
    rm -rf /usr/local/Homebrew

    # Install the MD5 checker or the recipes will fail
    notify "Installing md5sha1sum"
    su -l "$consoleuser" -c "/usr/local/bin/brew install md5sha1sum" 2>&1 | tee -a ${LOG}
    su -l "$consoleuser" -c "echo 'export PATH=/usr/local/opt/openssl/bin:\$PATH' >> /Users/$consoleuser/.bash_profile"
else
    # Run an update and quit
    notify "Updating Homebrew"
    su -l "$consoleuser" -c "/usr/local/bin/brew update" 2>&1 | tee -a ${LOG}
    exit 0
fi


# Tapping casks for driver, versions and fonts
/usr/local/bin/brew tap caskroom/drivers
/usr/local/bin/brew tap caskroom/versions
/usr/local/bin/brew tap caskroom/fonts
#brew tap varunyellina/brew-varunyellina

# Drivers
drivers=(
  logitech-unifying
)

# Install Drivers
echo "Installing drivers..."
/usr/local/bin/brew cask install ${drivers[@]}

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
/usr/local/bin/brew cask install ${apps[@]}

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
#/usr/local/bin/brew cask install ${fonts[@]}