#!/bin/bash

locationservices=$(/usr/bin/sudo -u _locationd /usr/bin/osascript -l JavaScript << EOS
$.NSUserDefaults.alloc.initWithSuiteName('com.apple.locationd').objectForKey(
'LocationServicesEnabled').js
EOS)

if [ $locationservices == "true" ]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi