authDBs=("system.preferences" "system.preferences.energysaver" "system.preferences.network" "system.preferences.printing" "system.preferences.sharing" "system.preferences.softwareupdate" "system.preferences.startupdisk" "system.preferences.timemachine")
for section in ${authDBs[@]}; do
/usr/bin/security -q authorizationdb read "$section" >
"/tmp/$section.plist"
key_value=$(/usr/libexec/PlistBuddy -c "Print :shared"
"/tmp/$section.plist" 2>&1)
if [[ "$key_value" == *"Does Not Exist"* ]]; then
/usr/libexec/PlistBuddy -c "Add :shared bool false"
"/tmp/$section.plist"
else
/usr/libexec/PlistBuddy -c "Set :shared false"
"/tmp/$section.plist"
fi
/usr/bin/security -q authorizationdb write "$section" <
"/tmp/$section.plist"
done