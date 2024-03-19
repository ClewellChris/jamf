#!/bin/bash 

timestamp=$(/usr/bin/sudo /usr/bin/sudo -V | /usr/bin/grep -c "Type of authentication
timestamp record: tty")
if [ $timestamp -eq 1 ]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi