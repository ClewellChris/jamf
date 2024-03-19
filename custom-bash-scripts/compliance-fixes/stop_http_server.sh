#!/bin/bash

# 4.2 Ensure HTTP Server Is Disabled (Automated)
# Profile Applicability:
# • Level 1

# Description:

# macOS used to have a graphical front-end to the embedded Apache web server in the
# Operating System. Personal web sharing could be enabled to allow someone on
# another computer to download files or information from the user's computer. Personal
# web sharing from a user endpoint has long been considered questionable, and Apple
# has removed that capability from the GUI. Apache, however, is still part of the Operating
# System and can be easily turned on to share files and provide remote connectivity to an
# end-user computer. Web sharing should only be done through hardened web servers
# and appropriate cloud services.

# Rationale:

# Web serving should not be done from a user desktop. Dedicated webservers or
# appropriate cloud storage should be used. Open ports make it easier to exploit the
# computer.

# Impact:

# The web server is both a point of attack for the system and a means for unauthorized
# file transfers.


# Stop the HTTP server

/usr/bin/sudo /usr/sbin/apachectl stop
/usr/bin/sudo /bin/launchctl unload -w /System/Library/LaunchDaemons/org.apache.httpd.plist