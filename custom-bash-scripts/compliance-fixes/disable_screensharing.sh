#!/bin/bash

# 2.3.3.2 Ensure Screen Sharing Is Disabled (Automated)
# Profile Applicability:
# • Level 1

# Description:

# Screen Sharing allows a computer to connect to another computer on a network and
# display the computer’s screen. While sharing the computer’s screen, the user can
# control what happens on that computer, such as opening documents or applications,
# opening, moving, or closing windows, and even shutting down the computer.
# While mature administration and management does not use graphical connections for
# standard maintenance, most help desks have capabilities to assist users in performing
# their work when they have technical issues and need support. Help desks use graphical
# remote tools to understand what the user sees and assist them so they can get back to
# work. For MacOS, some of these remote capabilities can use Apple's OS tools. Control
# is therefore not meant to prohibit the use of a just-in-time graphical view from authorized
# personnel with authentication controls. Sharing should not be enabled except in narrow
# windows when help desk support is required.
# Screen Sharing on macOS can allow the use of the insecure VNC protocol. VNC is a
# clear text protocol that should not be used on macOS.

# Rationale:

# Disabling Screen Sharing mitigates the risk of remote connections being made without
# the user of the console knowing that they are sharing the computer.

# Impact:

# Help desks may require the periodic use of a graphical connection mechanism to assist
# users. Any support that relies on native MacOS components will not work unless a
# scripted solution to enable and disable sharing as neccessary.

# Disable Screen Sharing
/usr/bin/sudo /bin/launchctl disable system/com.apple.screensharing