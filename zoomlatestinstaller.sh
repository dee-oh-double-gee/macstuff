#!/bin/bash
if [ -e /Applications/zoom.us.app ]
then
    echo "Zoom Already installed"
    exit 0
else
curl -L --remote-name https://zoom.us/client/latest/zoomusInstaller.pkg
sudo installer -pkg zoomusInstaller.pkg -target /
fi
