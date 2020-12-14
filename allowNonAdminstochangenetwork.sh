#!/bin/bash

result="No"

systemPrefsStatus="$(/usr/bin/security authorizationdb read system.preferences | xmllint --format - | grep -A 2 '<key>rule</key>' | grep '<string>' | awk -F '>|<' '{print $3}')"
echo "$systemPrefsStatus"
if [[ $systemPrefsStatus == "allow" ]]; then
    networkPrefStatus=$(/usr/bin/security authorizationdb read system.preferences.network | xmllint --format - | grep -A 2 "<key>rule</key>" | grep "<string>" | awk -F ">|<" '{print $3}')
    echo "$networkPrefStatus"
    if [[ $networkPrefStatus == "allow" ]]; then
        networkConfStatus=$(/usr/bin/security authorizationdb read system.services.systemconfiguration.network | xmllint --format - | grep -A 2 "<key>rule</key>" | grep "<string>" | awk -F ">|<" '{print $3}')
        echo "$networkConfStatus"
        if [[ $networkConfStatus == "allow" ]]; then
            result="Yes"
        fi
    fi
fi

echo "<result>$result</result>"
exit 0
