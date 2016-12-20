#!/bin/bash

echo "Creating done file"
touch ~/Library/.CasperSplashDone

# Launch script doesn't always remove the LaunchDaemon so forefully removing it here
sudo unload /Library/LaunchDaemons/io.fti.caspersplash.launch.plist
sudo rm -rf /Library/LaunchDaemons/io.fti.caspersplash.launch.plist

echo "Logging user out to force FileVault Encryption"
# For some reason this 👇 line doesn't work when launched from CasperSplash
# sudo kill -9 `pgrep loginwindow`

osascript -e 'tell application "System Events" to keystroke "q" using {command down, option down, shift down}'