#!/bin/bash

# 5.10 Ensure the Guest Home Folder Does Not Exist (Automated)
# Profile Applicability:
# • Level 1

# Description:

# In the previous two controls, the guest account login has been disabled and sharing to
# guests has been disabled, as well. There is no need for the legacy Guest home folder to
# remain in the file system. When normal user accounts are removed, you have the option
# to archive it, leave it in place, or delete. In the case of the guest folder, the folder
# remains in place without a GUI option to remove it. If at some point in the future a Guest
# account is needed, it will be re-created. The presence of the Guest home folder can
# cause automated audits to fail when looking for compliant settings within all User
# folders, as well. Rather than ignoring the folder's continued existence, it is best
# removed.

# Rationale:

# The Guest home folders are unneeded after the Guest account is disabled and could be
# used inappropriately.

# Impact:

# The Guest account should not be necessary after it is disabled, and it will be
# automatically re-created if the Guest account is re-enabled


# Remove the Guest home folder if it exists
if [ -d /Users/Guest ]; then
    /usr/bin/sudo /bin/rm -R /Users/Guest
fi