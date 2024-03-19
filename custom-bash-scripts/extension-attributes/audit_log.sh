#!/bin/bash

audit_log=$(/usr/bin/sudo /bin/launchctl list | /usr/bin/grep -i auditd | awk '{print $3}')

if [ "$audit_log" == "com.apple.auditd" ]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi