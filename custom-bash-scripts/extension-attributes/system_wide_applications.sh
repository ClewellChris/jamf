#!/bin/bash

# 5.1.5 Ensure Appropriate Permissions Are Enabled for System
# Wide Applications (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Applications in the System Applications Directory (/Applications) should be world-
# executable since that is their reason to be on the system. They should not be world-
# writable and allow any process or user to alter them for other processes or users to then
# execute modified versions.

# Rationale:

# Unauthorized modifications of applications could lead to the execution of malicious
# code.

# Impact:

# Applications changed will no longer be world-writable. Depending on the environment,
# there will be different risk tolerances on each non-conforming application. Global
# changes should not be performed where mission-critical applications are misconfigured.


system_wide_application=$(/usr/bin/sudo /usr/bin/find /Applications -iname "*\.app" -type d -perm -2 -ls | grep -v Xcode.app |/usr/bin/wc -l | /usr/bin/xargs)

if [ $system_wide_application -eq 0 ]; then
    echo "<result>Passed</result>"
else
    echo "<result>Failed</result>"
fi