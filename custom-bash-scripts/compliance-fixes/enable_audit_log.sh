#!/bin/bash

# 3.1 Ensure Security Auditing Is Enabled (Automated)
# Profile Applicability:
# • Level 1

# Description:

# macOS's audit facility, auditd, receives notifications from the kernel when certain
# system calls, such as open, fork, and exit, are made. These notifications are captured
# and written to an audit log.

# Rationale:

# Logs generated by auditd may be useful when investigating a security incident as they
# may help reveal the vulnerable application and the actions taken by a malicious actor.

# Auditd is not enabled by default. To enable it, run the following command:
/usr/bin/sudo /bin/launchctl load -w /System/Library/LaunchDaemons/com.apple.auditd.plist