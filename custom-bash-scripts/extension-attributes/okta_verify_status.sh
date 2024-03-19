#!/bin/bash

# Script to see if Okta Verify is running correctly

OKTA_INSTALLED="$($currentuser mdfind -name 'kMDItemFSName=="Okta 
Verify.app"')"

if [ "$OKTA_INSTALLED" != "" ]; then
    OKTA_CERT="$($currentuser security find-certificate -a -c 5B1BB994)"

    if [ "$OKTA_CERT" != "" ]; then
        CUR_DATE="$(date +'%s')"
        TEMP_DATE="$($currentuser security find-certificate -c 5B1BB994  
-p | openssl x509 -text | grep "Not After")"
        DATE_ARRAY=($TEMP_DATE)
        EXP_DATE="${DATE_ARRAY[3]} ${DATE_ARRAY[4]} ${DATE_ARRAY[6]}"
        EXP_DATE="$(date -j -f "%b %d %Y" "$EXP_DATE" "+%s")"
        EXP_TIME="$(($EXP_DATE-$CUR_DATE))"

        if (( EXP_TIME > 604800 )); then
            echo "<result>"Healthy"</result>"
        elif (( 0 < EXP_TIME < 604800 )); then
            echo "<result>"Healthy - Certificate Expiring Soon"</result>"
        else
            echo "<result>"Malfunctioning - Certificate Expired"</result>"
        fi
    else
        echo "<result>"Malfunctioning - Certificate Missing"</result>"
    fi
else
    echo "<result>"Not Installed"</result>"
fi
