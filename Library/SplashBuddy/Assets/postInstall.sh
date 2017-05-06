#!/bin/bash

touch /Users/Shared/.SplashBuddyDone

echo "Logging user out to force FileVault Encryption"
osascript -e 'tell application "System Events" to keystroke "q" using {command down, option down, shift down}'
