#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
MESSAGE=""
IP_ADDRESS=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=3

while IFS= read -r line
do
   USAGE=$(echo $line | awk '{print$6}' | cut -d "%" -f1)
   PARTITION=$(echo $line | awk '{print$7}')
   
    if [ "$USAGE" -ge "$DISK_THRESHOLD" ]; then
       MESSAGE+="HIGH DISK usage on $PARTITION:$USAGE% \n"
    fi

done <<< $DISK_USAGE

echo -e "$MESSAGE"

sh mail.sh "anilkumarmidde05@gmail.com" "High DISK Usage on $IP_ADDRESS" "$MESSAGE" "DISK_USAGE" "IP_ADDRESS" "DEV OPS TEAM"