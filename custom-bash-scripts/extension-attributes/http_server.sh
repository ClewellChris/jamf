#!/bin/bash

http_server=$(/usr/bin/sudo /bin/launchctl list | /usr/bin/grep -c "org.apache.httpd")

if [ $http_server -eq 1 ]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi