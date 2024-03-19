#!/bin/bash

# 5.5 Ensure a Separate Timestamp Is Enabled for Each User/tty
# Combo (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Using tty tickets ensures that a user must enter the sudo password in each Terminal
# session.
# With sudo versions 1.8 and higher, introduced in 10.12, the default value is to have tty
# tickets for each interface so that root access is limited to a specific terminal. The default
# configuration can be overwritten or not configured correctly on earlier versions of
# macOS.

# Rationale:

# In combination with removing the sudo timeout grace period, a further mitigation should
# be in place to reduce the possibility of a background process using elevated rights when
# a user elevates to root in an explicit context or tty.
# Additional mitigation should be in place to reduce the risk of privilege escalation of
# background processes.

# Impact:

# This control should have no user impact. Developers or installers may have issues if
# background processes are spawned with different interfaces than where sudo was
# executed.

terminalTTY=`cat /etc/sudoers | grep timestamp_type`
if [ "$sudoTimeout" = "" ]; then
	echo "Defaults timestamp_type=tty" >> /etc/sudoers
fi