#!/bin/bash

amfi=$(/usr/bin/sudo /usr/sbin/nvram -p | /usr/bin/grep -c "amfi_get_out_of_my_way=1")

if [ $amfi -eq 0 ]; then
    echo "<result>Enabled</result>"
else
    echo "<result>Disabled</result>"
fi