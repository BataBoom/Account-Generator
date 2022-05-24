#!/bin/bash
# Random Acct Generator
# Change email domains below (lines 9-11) & pick a topic and replace it on line 15 | https://random-data-api.com/documentation

#Requires m3o-cli for generating pass
#m3o curl -fssl https://install.m3o.com/cli | /bin/bash
#export M3O_API_TOKEN=xxyourxxkeyxx #https://m3o.com#

email[0]="@yourdomain.com"
email[1]="@yourdomain1.com"
email[2]="@yourdomain2.com"
rand=$[$RANDOM % ${#email[@]}]
emailmix=${email[$rand]}

wget -O strain.json "https://random-data-api.com/api/cannabis/random_cannabis?size=2&is_xml=false" &> /dev/null
strain=`jq -r ".[1].strain" strain.json | sed 's/\s//g'|tr -d '\n'`

weedEmail=$strain$emailmix

mainpw=`/home/yourusername/bin/m3o password generate > genpw.json` &> /dev/null
mainpwparse=`jq -r .password genpw.json` &> /dev/null

echo "Email: $weedEmail"
echo "Password: $mainpwparse"

