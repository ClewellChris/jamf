#!/bin/bash

nfs_server=$(/usr/bin/sudo /bin/launchctl list | /usr/bin/grep -c com.apple.nfsd)

if [ $nfs_server -eq 1 ]; then
    echo "<result>Disabled</result>"
else
    echo "<result>Enabled</result>"
fi