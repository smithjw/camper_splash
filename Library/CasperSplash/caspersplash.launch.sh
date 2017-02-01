#!/bin/bash
app="/Library/CasperSplash/CasperSplash.app"
loggedInUser=$(/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }')
doneFile="/Users/Shared/.CasperSplashDone"
enrolmentScript="/Library/CasperSplash/enrolment.sh"

# Check if:
# - CasperSplash binary exists (is fully installed)
# - User is in control (not _mbusersetup)
# - User is on desktop (Finder process exists)
# - There is no doneFile

if [ -f "$app"/Contents/MacOS/CasperSplash ] \
	&& [ "$loggedInUser" != "_mbusersetup" ] \
	&& [ $(pgrep Finder | wc -l) -gt 0 ] \
	&& [ ! -f "${doneFile}" ]; then

    open -a "$app"
	."$enrolmentScript"
fi

exit 0
