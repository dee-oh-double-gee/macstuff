#!/bin/bash


osascript <<EOD
tell application "Terminal"
    do script "/osx_homebrew_setup_original.sh"
end tell
EOD
