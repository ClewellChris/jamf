#!/bin/bash

# Script to see if AWS VPN Client is setup correctly


LOGGED_IN_USER=$(stat -f %Su /dev/console)
STATUS="$(ls /Users/$LOGGED_IN_USER/.config/AWSVPNClient/OpenVpnConfigs/ 
| 
grep -v "current_connection.txt")"

STATUS="$(ls /Users/$currentuser/.config/AWSVPNClient/OpenVpnConfigs/ | 
grep -v "current_connection.txt")"

if [[ "$STATUS" != "" ]]; then
    echo "<result>"Setup"</result>"
else
    echo "<result>"Broken"</result>"
fi