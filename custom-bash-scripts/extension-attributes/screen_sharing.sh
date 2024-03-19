#!/bin/bash

screensharing=$(/usr/bin/sudo /bin/launchctl list | grep -c com.apple.screensharing)

if [ $screensharing -eq 1 ]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi