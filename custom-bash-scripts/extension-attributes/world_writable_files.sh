#!/bin/bash


world_writable=$(/usr/bin/sudo /usr/bin/find /System/Volumes/Data/System -type d -perm -2 -ls | /usr/bin/grep -v "downloadDir" | /usr/bin/wc -l | /usr/bin/xargs)

if [ $world_writable -eq 0 ]; then
    echo "<result>Passed</result>"
else
    echo "<result>Failed</result>"
fi