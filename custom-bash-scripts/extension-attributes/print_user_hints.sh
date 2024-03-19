#!/bin/bash

hints=$(/usr/bin/sudo /usr/bin/dscl . -list /Users hint)

if [ -z "$hints" ]; then
    echo "<result>No user hints found</result>"
else
    echo "<result>$hints</result>"
fi