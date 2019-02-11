#!/bin/bash
# Grabs the latest version of Chrome from their site and installs it
# From here https://github.com/TSPARR/macOS-Scripts/blob/master/Install%20Latest%20Chrome.sh


if [ -e /Applications/Google\ Chrome.app ]
then
    echo "Chrome Already installed"
    exit 0
else
# Installing Chrome
curl -L -o /tmp/googlechrome.dmg "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg"
hdiutil mount -nobrowse /tmp/googlechrome.dmg
cp -R "/Volumes/Google Chrome/Google Chrome.app" /Applications
hdiutil unmount "/Volumes/Google Chrome"
rm /tmp/googlechrome.dmg
fi