#!/bin/bash

# Script to deploy a LaunchDaemon that will run jamfRestart.sh every 24 hours which will check Jamf Binary and kill it if it's been running for more than 24 hours
# Additionally the script will create a log file at /var/log/jamfRestart.log to track when there is a kill event and send that to Jamf as an extension attribute. 

launchDJobPath="/Library/LaunchDaemons/com.jamfrestart.plist"
label=$(basename $launchDJobPath | sed 's/.plist//')
scriptPath="/Library/Scripts/jamfRestart.sh"
if [[ ! -d "$(dirname $scriptPath)" ]]; then
    mkdir -p "$(dirname $scriptPath)"
fi

#Create jamfRestart.sh script and add it to /Library/Scripts
tee "$scriptPath" << "EndOfScript"
#!/bin/bash


processRuntime=$(ps -ax -o user,pid,etime,args | grep "/usr/local/[j]amf/bin/jamf policy -stopConsoleLogs -randomDelaySeconds 300" | awk '{ print $3; }' | grep -o '.*[-]' | awk -F\- '{print $1}')
processCheck=$(ps -ax -o user,pid,etime,args | grep "/usr/local/[j]amf/bin/jamf policy -stopConsoleLogs -randomDelaySeconds 300" | awk '{ print $2; }')

logLocation="/var/log/jamfRestart.log"
scriptLogging(){

    DATE=`date +%Y-%m-%d\ %H:%M:%S`
    LOG="$logLocation"
    
    echo "$DATE" " $1" >> $LOG
}

	if [ "${processRuntime}" = "" ]; then
        scriptLogging "JamfBinary has not run for more than 1 day"
    else
        scriptLogging "JamfBinary has run for ${processRuntime} days"
        scriptLogging "JamfBinary Process ID: ${processCheck}"
        scriptLogging "Quitting JamfBinary..."
        sudo kill -9 ${processCheck}
    fi
    
exit 0
EndOfScript

chown root:wheel "$scriptPath"
chmod 755 "$scriptPath"

#If job is loaded, boot it out
if [[ -f "$launchDJobPath" ]]; then
	launchctl bootout system "$launchDJobPath"
fi

# Create LaunchDaemon to run jamfRestart.sh every 24 hours and load it
tee "$launchDJobPath" << EndOfLaunchDJob
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
		<key>Label</key>
		<string>$label</string>
		<key>ProgramArguments</key>
		<array>
			<string>sh</string>
			<string>/Library/Scripts/jamfRestart.sh</string>
		</array>
        <key>RunAtLoad</key>
	    <false/>
		<key>StartInterval</key>
		<integer>86400</integer>
</dict>
</plist>
EndOfLaunchDJob

#Set permissions
chown root:wheel "$launchDJobPath"
chmod 644 "$launchDJobPath"

#Load job 
launchctl bootstrap system "$launchDJobPath"