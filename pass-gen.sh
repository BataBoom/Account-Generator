#!/bin/bash
# Random Email Generator
# Change email domains below (lines 4-7) & pick a topic and replace it on line 10 | https://random-data-api.com/documentation
email[0]="@yourdomain.com"
email[1]="@yourdomain1.club"
email[2]="@yourdomain2.co"
rand=$[$RANDOM % ${#email[@]}]
emailmix=${email[$rand]}

wget -O strain.json "https://random-data-api.com/api/cannabis/random_cannabis?size=2&is_xml=false" &> /dev/null
strain=`jq -r ".[1].strain" strain.json | sed 's/\s//g'|tr -d '\n'`

weedEmail=$strain$emailmix
genpass=`pass generate mypass/$weedEmail 16`
mypass=`pass mypass/$weedEmail`
echo "Email: $weedEmail"
echo "Password: $mypass"
