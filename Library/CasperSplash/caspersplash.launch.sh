#!/bin/bash
plist="/Library/LaunchAgents/io.fti.caspersplash.launch.plist"

loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
app="/Library/CasperSplash/CasperSplash.app"
script="/Library/CasperSplash/enrolment.sh"
doneFile="/Users/${loggedInUser}/Library/.CasperSplashDone"

# Check if:
# - CasperSplash binary exists (is fully installed)
# - User is in control (not _mbusersetup)
# - User is on desktop (Finder process exists)

if [ -f "$app"/Contents/MacOS/CasperSplash ] \
	&& [ "$loggedInUser" != "_mbusersetup" ] \
	&& [ $(pgrep Finder | wc -l) -gt 0 ] \
	&& [ ! -f "${doneFile}" ]; then

    open -a "$app"
	."$script"
	
	# remove and uninstall the launchdaemon

    launchctl remove io.fti.caspersplash.launch
    rm "$plist"

fi

exit 0
