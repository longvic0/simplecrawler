#!/bin/bash
#step 1: gen hbo sql query file: input hboviplist.txt ( one accoutname, each line )
while read x; do NAMES="$NAMES,'$x'"; done < hboviplist.txt
NAMES=${NAMES:1}
SQL='SELECT * FROM table WHERE account_name IN ('$NAMES')'
echo "$SQL" > hboviplist.sql
#step 2: export,hbo vip list : output hbouserlist.txt ( mobile | userid | expired date|create_date)

#step 3: renew hbo process



while IFS='|' read -r a b c d ; do
#while read -r a|b|c|d; do
echo "curl --location --request POST 'api-url' -H 'Content-Type: application/x-www-form-urlencoded' --data-urlencode 'MOBILE=$a' --data-urlencode 'MEMBER_ID=$b' --data-urlencode 'PRICE=8029' --data-urlencode 'PACKAGE_DAYS=30' --data-urlencode 'EXPIRE_DATE=$c' --data-urlencode 'PROMOTION_DAY=0' --data-urlencode 'CREATE_DATE=$d'" >> tmp.txt

done < hbouserlist.txt 
