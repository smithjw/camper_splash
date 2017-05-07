#!/bin/bash
app="/Library/SplashBuddy/SplashBuddy.app"
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
doneFile="/Users/Shared/.SplashBuddyDone"
enrolmentScript="/Library/SplashBuddy/enrolment.sh"

# Check if:
# - SplashBuddy binary exists (is fully installed)
# - User is in control (not _mbusersetup)
# - User is on desktop (Finder process exists)
# - Application is not already running

function IsRunning()
{
pgrep "SplashBuddy" && return 1 || return 0
}

if IsRunning && [ -f "$app"/Contents/MacOS/SplashBuddy ] \
	&& [ "$loggedInUser" != "_mbusersetup" ] \
	&& [ $(pgrep Finder | wc -l) -gt 0 ] \
	&& [ ! -f "${doneFile}" ]; then

	echo "Opening SplashBuddy"
    open -a "$app"
    echo "Running enrolment script"
    sudo "$enrolmentScript"
    echo "Unloading LaunchDaemon"
    launchctl unload /Library/LaunchDaemons/io.fti.splashbuddy.launch.plist
    rm -f /Library/LaunchDaemons/io.fti.splashbuddy.launch.plist
fi

exit 0
