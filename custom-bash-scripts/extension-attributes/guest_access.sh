#!/bin/bash 
 
 guest_access=$(/usr/bin/sudo /usr/sbin/sysadminctl -smbGuestAccess status | awk '{print $NF}')