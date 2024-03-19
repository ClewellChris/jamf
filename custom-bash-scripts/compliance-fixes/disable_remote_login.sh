#!/bin/bash

# 2.3.3.5 Ensure Remote Login Is Disabled (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Remote Login allows an interactive terminal connection to a computer.

# Rationale:

# Disabling Remote Login mitigates the risk of an unauthorized person gaining access to
# the system via Secure Shell (SSH). While SSH is an industry standard to connect to
# posix servers, the scope of the benchmark is for Apple macOS clients, not servers.
# macOS does have an IP-based firewall available (pf, ipfw has been deprecated) that is
# not enabled or configured. There are more details and links in the Network sub-section.

# macOS no longer has TCP Wrappers support built in and does not have strong Brute-
# Force password guessing mitigations, or frequent patching of openssh by Apple. Since
# most macOS computers are mobile workstations, managing IP-based firewall rules on
# mobile devices can be very resource intensive. All of these factors can be parts of
# running a hardened SSH server.

# Impact:

# The SSH server built into macOS should not be enabled on a standard user computer,
# particularly one that changes locations and IP addresses. A standard user that runs
# local applications, including email, web browser, and productivity tools, should not use
# the same device as a server. There are Enterprise management toolsets that do utilize
# SSH. If they are in use, the computer should be locked down to only respond to known,
# trusted IP addresses and appropriate administrator service accounts.
# For macOS computers that are being used for specialized functions, there are several
# options to harden the SSH server to protect against unauthorized access, including
# brute force attacks. There are some basic criteria that need to be considered:
# • Do not open an SSH server to the internet without controls in place to mitigate
# SSH brute force attacks. This is particularly important for systems bound to
# Directory environments. It is great to have controls in place to protect the system,
# but if they trigger after the user is already locked out of their account, they are not
# optimal. If authorization happens after authentication, directory accounts for
# users that don't even use the system can be locked out.
# • Do not use SSH key pairs when there is no insight to the security on the client
# system that will authenticate into the server with a private key. If an attacker gets
# access to the remote system and can find the key, they may not need a
# password or a key logger to access the SSH server.
# • Detailed instructions on hardening an SSH server, if needed, are available in the
# CIS Linux Benchmarks, but it is beyond the scope of this benchmark.


# Disable Remote Login
/usr/bin/sudo /usr/sbin/systemsetup -setremotelogin off

# When Promted, enter Yes 