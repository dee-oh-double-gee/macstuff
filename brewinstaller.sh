#!/bin/bash
User=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
sudo -Hu ${User} /usr/local/bin/brew cask reinstall $1
exit 0

