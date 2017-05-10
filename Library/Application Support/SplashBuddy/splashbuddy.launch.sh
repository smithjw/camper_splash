#!/bin/bash
app="/Library/Application Support/SplashBuddy/SplashBuddy.app"
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
doneFile="/Users/Shared/.SplashBuddyDone"

# Check if:
# - SplashBuddy binary exists (is fully installed)
# - User is in control (not _mbusersetup)
# - User is on desktop (Finder process exists)
# - Application is not already running

if [ -f "$app"/Contents/MacOS/SplashBuddy ] \
	&& [ "$loggedInUser" != "_mbusersetup" ] \
	&& [ $(pgrep Finder | wc -l) -gt 0 ] \
	&& [ ! -f "${doneFile}" ]; then

	echo "Opening SplashBuddy"
	open -a "$app"
fi

exit 0
