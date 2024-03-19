#!/bin/bash

# 5.1.6 Ensure No World Writable Folders Exist in the System
# Folder (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Software sometimes insists on being installed in the /System/Volumes/Data/System
# Directory and has inappropriate world-writable permissions.
# Macs with writable files in System should be investigated forensically. A file with open
# writable permissions is a sign of at best a rogue application. It could also be a sign of a
# computer compromise and a persistent presence on the system.

# Rationale:

# Folders in /System/Volumes/Data/System should not be world-writable. The audit check
# excludes the "Drop Box" folder that is part of Apple's default user template.

# Impact:

# Changing file permissions could disrupt the use of applications that rely on files in the
# System Folder with vulnerable permissions.

/usr/bin/sudo IFS=$'\n'
for sysPermissions in $( /usr/bin/find /System/Volumes/Data/System -type d -perm -2 | /usr/bin/grep -v "downloadDir" ); do
    /bin/chmod -R o-w "$sysPermissions"
done