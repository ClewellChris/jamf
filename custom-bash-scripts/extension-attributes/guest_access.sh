#!/bin/bash 

# 2.12.2 Ensure Guest Access to Shared Folders Is Disabled
# (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Allowing guests to connect to shared folders enables users to access selected shared
# folders and their contents from different computers on a network.

# Rationale:

# Not allowing guests to connect to shared folders mitigates the risk of an untrusted user
# doing basic reconnaissance and possibly using privilege escalation attacks to take
# control of the system.

# Impact:

# Unauthorized users could access shared files on the system.
 
 guest_access=$(/usr/bin/sudo /usr/sbin/sysadminctl -smbGuestAccess status | awk '{print $NF}')
    if [ "$guest_access" == "DISABLED" ]; then
        echo "<result>Disabled</result>"
    else
        echo "<result>Enabled</result>"
    fi