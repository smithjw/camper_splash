#!/bin/bash
echo "Pulling down FileVault 2 configuration"
/usr/local/bin/jamf policy -trigger requireFV2

echo "Installing CAmper Assets"
/usr/local/bin/jamf policy -trigger camperAssets

echo "Installing DockUtil"
/usr/local/bin/jamf policy -trigger installDockUtil

echo "Re-enabling LittleSnitch where it had been disabled"
/usr/local/bin/jamf policy -trigger enableLittleSnitch

echo "Installing VPN Client"
/usr/local/bin/jamf policy -trigger installViscosity

echo "Installing Zoom"
/usr/local/bin/jamf policy -trigger installZoom

echo "Installing Slack"
/usr/local/bin/jamf policy -trigger installSlack

echo "Installing Google Chrome"
/usr/local/bin/jamf policy -trigger installChrome

echo "Installing Box Sync client"
/usr/local/bin/jamf policy -trigger installBox

echo "Installing Quip"
/usr/local/bin/jamf policy -trigger installQuip

echo "Setting up CAmper's Dock"
/usr/local/bin/jamf policy -trigger setDock

echo "Updating Inventory"
/usr/local/bin/jamf policy -trigger updateInventory