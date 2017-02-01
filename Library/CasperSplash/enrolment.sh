#!/bin/bash

rm -rf /Library/LaunchDaemons/io.fti.caspersplash.launch.plist

jamfbinary="/usr/local/bin/jamf"

echo "Pulling down FileVault 2 configuration"
"$jamfbinary" policy -trigger "requireFV2"

echo "Installing CAmper Assets"
"$jamfbinary" policy -trigger "camperAssets"

echo "Installing DockUtil"
"$jamfbinary" policy -trigger "installDockUtil"

echo "Re-enabling LittleSnitch where it had been disabled"
"$jamfbinary" policy -trigger "enableLittleSnitch"

echo "Installing VPN Client"
"$jamfbinary" policy -trigger "install-Viscosity"

echo "Installing Zoom"
"$jamfbinary" policy -trigger "install-Zoom"

echo "Installing Slack"
"$jamfbinary" policy -trigger "install-Slack"

echo "Installing Google Chrome"
"$jamfbinary" policy -trigger "install-Google Chrome"

echo "Installing Box Sync client"
"$jamfbinary" policy -trigger "install-Box Sync"

echo "Installing Quip"
"$jamfbinary" policy -trigger "install-Quip"

echo "Setting up CAmper's Dock"
"$jamfbinary" policy -trigger "setDock"

echo "Updating Inventory"
"$jamfbinary" policy -trigger "updateInventory"