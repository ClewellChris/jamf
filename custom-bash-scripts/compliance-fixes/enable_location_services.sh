#!/bin/bash

# 2.6.1.1 Ensure Location Services Is Enabled (Automated)
# Profile Applicability:
# • Level 2

# Description:

# macOS uses location information gathered through local Wi-Fi networks to enable
# applications to supply relevant information to users. With the operating system verifying
# the location, users do not need to change the time or the time zone. The computer will
# change them based on the user's location. They do not need to specify their location for
# weather or travel times, and they will receive alerts on travel times to meetings and
# appointments where location information is supplied.
# Location Services simplify some processes with mobile computers, such as asset
# management and time or log management.
# There are some use cases where it is important that the computer not be able to report
# its exact location. While the general use case is to enable Location Services, it should
# not be allowed if the physical location of the computer and the user should not be public
# knowledge.

# Rationale:

# Location Services are helpful in most use cases and can simplify log and time
# management where computers change time zones.

# Enable Location Services
/usr/bin/sudo /bin/launchctl load -w /System/Library/LaunchDaemons/com.apple.locationd.plist