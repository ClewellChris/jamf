#!/bin/bash
#https://www.jamf.com/jamf-nation/discussions/10009/uptime-or-last-shutdown-restart#responseChild55774
echo "<result>$(date -jf "%s" "$(sysctl kern.boottime | awk -F'[= |,]' '{print $6}')" +"%Y-%m-%d %T")</result>"