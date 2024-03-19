#!/bin/bash

# 5.1.3 Ensure Apple Mobile File Integrity (AMFI) Is Enabled
# (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Apple Mobile File Integrity (AMFI) was first released in macOS 10.12. The daemon and
# service block attempts to run unsigned code. AMFI uses lanchd, code signatures,
# certificates, entitlements, and provisioning profiles to create a filtered entitlement
# dictionary for an app. AMFI is the macOS kernel module that enforces code-signing and
# library validation.

# Rationale:

# Apple Mobile File Integrity validates that application code is validated.

/usr/bin/sudo /usr/sbin/nvram boot-args=""