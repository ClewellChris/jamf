#!/bin/bash

# 5.4 Ensure the Sudo Timeout Period Is Set to Zero (Automated)
# Profile Applicability:
# • Level 1

# Description:

# The sudo command allows the user to run programs as the root user. Working as the
# root user allows the user an extremely high level of configurability within the system.
# This control, along with the control to use a separate timestamp for each tty, limits the
# window where an unauthorized user, process, or attacker could utilize legitimate
# credentials that are valid for longer than required.

# Rationale:

# The sudo command stays logged in as the root user for five minutes before timing out
# and re-requesting a password. This five-minute window should be eliminated since it
# leaves the system extremely vulnerable. This is especially true if an exploit were to gain
# access to the system, since they would be able to make changes as a root user.

sudoTimeout=`cat /etc/sudoers | grep timestamp`
if [ "$sudoTimeout" = "" ]; then
	echo "Defaults timestamp_timeout=0" >> /etc/sudoers
fi