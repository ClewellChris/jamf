#!/bin/bash

# 4.3 Ensure NFS Server Is Disabled (Automated)
# Profile Applicability:
# • Level 1

# Description:

# macOS can act as an NFS fileserver. NFS sharing could be enabled to allow someone
# on another computer to mount shares and gain access to information from the user's
# computer. File sharing from a user endpoint has long been considered questionable,
# and Apple has removed that capability from the GUI. NFSD is still part of the Operating
# System and can be easily turned on to export shares and provide remote connectivity to
# an end-user computer.
# The etc/exports file contains the list of NFS shared directories. If the file exists, it is likely
# that NFS sharing has been enabled in the past or may be available periodically. As an
# additional check, the audit verifies that there is no /etc/exports file.

# Rationale:

# File serving should not be done from a user desktop. Dedicated servers should be used.
# Open ports make it easier to exploit the computer.

# Impact:

# The nfs server is both a point of attack for the system and a means for unauthorized file
# transfers.


# Stop the NFS server
/usr/bin/sudo /sbin/nfsd stop
/usr/bin/sudo /bin/launchctl disable system/com.apple.nfsd

# Remove the /etc/exports file
if [ -f /etc/exports ]; then
    /usr/bin/sudo /bin/rm /etc/exports
fi