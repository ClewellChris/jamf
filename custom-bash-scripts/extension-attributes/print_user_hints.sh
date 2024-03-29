#!/bin/bash

# 2.11.1 Ensure Users' Accounts Do Not Have a Password Hint
# (Automated)
# Profile Applicability:
# • Level 1
#
# Description:
#
# Password hints help the user recall their passwords for various systems and/or
# accounts. In most cases, password hints are simple and closely related to the user's
# password.
#
# Rationale:
#
# Password hints that are closely related to the user's password are a security
# vulnerability, especially in the social media age. Unauthorized users are more likely to
# guess a user's password if there is a password hint. The password hint is very
# susceptible to social engineering attacks and information exposure on social media
# networks.

hints=$(/usr/bin/sudo /usr/bin/dscl . -list /Users hint)

if [ -z "$hints" ]; then
    echo "<result>No user hints found</result>"
else
    echo "<result>$hints</result>"
fi