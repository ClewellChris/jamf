#!/bin/bash


system_wide_application=$(/usr/bin/sudo /usr/bin/find /Applications -iname "*\.app" -type d -perm -2 -ls | grep -v Xcode.app |/usr/bin/wc -l | /usr/bin/xargs)

if [ $system_wide_application -eq 0 ]; then
    echo "<result>Passed</result>"
else
    echo "<result>Failed</result>"
fi