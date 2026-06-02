#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
MESSAGE_BODY=$3
ALERT_TYPE=$4
SERVER_IP=$5
TO_TEAM=$6
SCRIPT_DIR=$PWD
FINAL_MESSAGE_BODY=$(echo $MESSAGE_BODY | sed -e "s/'/'\\\\''/g")

FINAL_MESSAGE=$(sed \
-e "s|TO_TEAM|$TO_TEAM|g" \
-e "s|ALERT_TYPE|$ALERT_TYPE|g" \
-e "s|Server_IP|$SERVER_IP|g" \
-e "s|Message|$MESSAGE_BODY|g" \
$Script_DIR/template.html)



{
echo "To: $TO_ADDRESS"
echo "Subject: $SUBJECT"
echo "Content-Type: text/html"
echo ""
echo "$FINAL_MESSAGE"
} | msmtp "$TO_ADDRESS"