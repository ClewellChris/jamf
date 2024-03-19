#!/bin/bash

#!/bin/bash

# 5.6 Ensure the "root" Account Is Disabled (Automated)
# Profile Applicability:
# • Level 1

# Description:

# The root account is a superuser account that has access privileges to perform any
# actions and read/write to any file on the computer. With some versions of Linux, the
# system administrator may commonly use the root account to perform administrative
# functions.

# Rationale:

# Enabling and using the root account puts the system at risk since any successful exploit
# or mistake while the root account is in use could have unlimited access privileges within
# the system. Using the sudo command allows users to perform functions as a root user
# while limiting and password protecting the access privileges. By default the root account
# is not enabled on a macOS computer. An administrator can escalate privileges using
# the sudo command (use -s or -i to get a root shell).

# Impact:

# Some legacy POSIX software might expect an available root account.

/usr/bin/sudo /usr/sbin/dsenableroot -d

username = root
user password: