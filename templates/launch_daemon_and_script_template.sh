#!/bin/bash
# Run a job every week on Monday to rename the computer to its serial number
# Run with sudo!

launchDJobPath="/Library/LaunchDaemons/com.demo.renameToSerial.MW10AM.plist"
label=$(basename $launchDJobPath | sed 's/.plist//')
scriptPath="/Library/AnyOrg/Scripts/scheduled/renameToSerial.sh"
mkdir -p "$(dirname $scriptPath)"

tee "$scriptPath" << "EndOfScript"
#!/bin/bash

serialNo=$(system_profiler SPHardwareDataType | awk '/Serial Number/{print $NF}')
scutil --set ComputerName $serialNo
scutil --set HostName $serialNo
scutil --set LocalHostName $serialNo
EndOfScript

chown root:wheel "$scriptPath"
chmod 755 "$scriptPath"

#If job is loaded, boot it out
if [[ -f "$launchDJobPath" ]]; then
    launchctl bootout system "$launchDJobPath"
fi

tee "$launchDJobPath" << EndOfLaunchDJob
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>$label</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>$scriptPath</string>
    </array>
    <key>StartCalendarInterval</key>
    <array>
      <dict>
        <key>Hour</key>
        <integer>16</integer>
        <key>Minute</key>
        <integer>20</integer>
        <key>Weekday</key>
        <integer>1</integer>
      </dict>
      <dict>
        <key>Hour</key>
        <integer>10</integer>
        <key>Weekday</key>
        <integer>3</integer>
      </dict>
    </array>
</dict>
</plist>
EndOfLaunchDJob

#Set permissions
chown root:wheel "$launchDJobPath"
chmod 644 "$launchDJobPath"
#Load job 
launchctl bootstrap system "$launchDJobPath"