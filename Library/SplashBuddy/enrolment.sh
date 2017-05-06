#!/bin/bash

jamfbinary=$(/usr/bin/which jamf)
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
doneFile="/Users/Shared/.SplashBuddyDone"

echo "Installing CAmper Assets"
${jamfbinary} policy -trigger "camperAssets"

echo "Installing DockUtil"
${jamfbinary} policy -trigger "installDockUtil"

echo "Re-enabling LittleSnitch where it had been disabled"
${jamfbinary} policy -trigger "enableLittleSnitch"

echo "Installing VPN Client"
${jamfbinary} policy -trigger "install-Viscosity"

echo "Installing Zoom"
${jamfbinary} policy -trigger "install-Zoom"

echo "Installing Slack"
${jamfbinary} policy -trigger "install-Slack"

echo "Installing Google Chrome"
${jamfbinary} policy -trigger "install-Google Chrome"

echo "Installing Box Sync client"
${jamfbinary} policy -trigger "install-Box Sync"

echo "Setting up CAmper's Dock"
${jamfbinary} policy -trigger "setDock"

echo "Pulling down FileVault 2 configuration"
${jamfbinary} policy -trigger "requireFV2"

echo "Updating Inventory"
${jamfbinary} policy -trigger "updateInventory"

echo "Creating done file"
touch "$doneFile"

echo "Logging user out to force FileVault Encryption"

osascript -e 'tell application "System Events" to keystroke "q" using {command down, option down, shift down}'