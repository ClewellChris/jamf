# #!/bin/bash

# ###################
# ### Adam T.
# ### April 16, 2020
# ### This is a JamfHelper Script which will be used to notify user if they have not restarted the computer in 7 days
# ### This script will give the user options how to proceed (now, 1 min, 5 min, 30 min 1 hr, 2 hrs as an example)
# ### This is needed as staff members tend not to restart their computers often
# ### This script is called from another script that checks uptime
# ##################
# ### Using Jamf Helper is cool
# #################

# #Message type variables below

# #Utility window gives a white background
# window="utility"
# title="**Red Canary IT**"
# heading="Computer Restart Needed"
# description="Your computer has not been restarted in at least 14 days. A more frequent restart is recommended.

# Doing so optimizes the performance of your computer as well as allows us to deploy security updates or new applications to you automatically.

# Please restart now."

# icon=""

# selection=$("/Library/Application Support/JAMF/bin/jamfHelper.app/Contents/MacOS/jamfHelper" -windowType "$window" -title "$title" -heading "$heading" -description "$description" -icon "$icon" -button2 "Restart"  -showDelayOptions "0, 60, 300, 3600, 7200" -button1 "Restart Later" -cancelButton 1)

# buttonClicked="${selection:$i-1}"
# timeChosen="${selection%?}"

# ## Convert seconds to minutes for restart command
# timeMinutes=$((timeChosen/60))

# ## Echoes for troubleshooting purposes
# echo "Button clicked was: $buttonClicked"
# echo "Time chosen was: $timeChosen"
# echo "Time in minutes: $timeMinutes"

# if [[ "$buttonClicked" == "2" ]] && [[ ! -z "$timeChosen" ]]; then
#     echo "Restart button was clicked. Initiating restart in $timeMinutes minutes"
#     shutdown -r +${timeMinutes}
# elif [[ "$buttonClicked" == "2" ]] && [[ -z "$timeChosen" ]]; then
#     echo "Restart button was clicked. Initiating immediate restart"
#     shutdown -r now
# elif [ "$buttonClicked" == "1" ]; then
#     echo "Cancel button clicked. Exiting..."
#     exit 0
# fi


# exit




# #!/bin/zsh

# ###Captured the following from the script "https://github.com/SecondSonConsulting/Renew/blob/main/Renew.sh" starting at line 714 
# #Determine current Unix epoch time
# CURRENT_TIME="$(date '+%s')"
# #This reports the unix epoch time that the kernel was booted
# BOOT_TIME="$(sysctl -n kern.boottime | awk -F 'sec = |, usec' '{ print $2; exit }')"
# #Get uptime in seconds by doing maths
# UPTIME_SECONDS="$(( CURRENT_TIME - BOOT_TIME ))"
# ### End of capture

# LOGGED_IN_USER=$(sudo last | head -1 | awk '{print $1;}')
# DND_SETTING="$(sudo -u $LOGGED_IN_USER defaults read com.apple.controlcenter.plist "NSStatusItem Visible FocusModes")"
# ZOOM_MEETING="$(lsof -i 4UDP | grep zoom | wc -l)"

# if (( (ZOOM_MEETING == 0 || ZOOM_MEETING == 1) && DND_MODE == 0 )); then
#     #1814400 is 3 weeks in seconds
#     if (( UPTIME_SECONDS > 1814400 )); then
#             /usr/local/bin/dialog \
#         --title "Restart Needed" \
#         --titlefont size=22 \
#         --message "**Red Canary IT** \n\nYour computer may be missing important patches and updates. \n\nPlease restart at your earliest convenience." \
#         --button1text "Restart Now" \
#         --width 300 --height 400 \
#         --messagefont size=16 \
#         --position centre \
#         --ontop \
#         --messagealignment centre \
#         --messageposition centre \
#         --centericon \
#         --icon "/Applications/Red Canary Self Service.app" \
#         --button2text "Restart Later" \
#         --buttonstyle centre \
        
#         dialogResults=$?

#         if [ "$dialogResults" = 0 ]; then
#             #This mimics Apple > Restart menu option, so user will get a confirmation and have a chance to save work or cancel.
#             osascript -e 'tell app "loginwindow" to «event aevtrrst»'

#             #Could also use the command below for immediate shutdown
#             #shutdown -r now
#         fi
#     fi
# fi


/usr/local/bin/dialog \
        --title "Restart Needed" \
        --titlefont size=22 \
        --message "**Red Canary IT** \n\nYour computer may be missing important patches and updates. \n\nPlease restart at your earliest convenience." \
        --button1text "Restart Now" \
        --width 300 --height 400 \
        --messagefont size=16 \
        --position centre \
        --ontop \
        --messagealignment centre \
        --messageposition centre \
        --centericon \
        --icon "/Applications/Red Canary Self Service.app" \
        --button2text "Restart Later" \
        --buttonstyle centre \
        
        dialogResults=$?

        if [ "$dialogResults" = 0 ]; then
            #This mimics Apple > Restart menu option, so user will get a confirmation and have a chance to save work or cancel.
            osascript -e 'tell app "loginwindow" to «event aevtrrst»'

            #Could also use the command below for immediate shutdown
            #shutdown -r now
        fi
