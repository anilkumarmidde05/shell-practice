#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/$0.log"

if [ $USERID -ne 0 ]; then
   echo "please run this script with root user" | tee -a $LOGS_FILE
   exit 1
fi
mkdir -p $LOGS_FOLDER
VALIDATE(){
if [ $1 -ne 0 ]; then
   echo "$2 ...failure" | tee -a $LOGS_FILE
   exit 1
else
   echo "$2 ....success" | tee -a $LOGS_FILE
   
fi
}


for package in $@ # sudo sh 14-loops.sh nginx mysql nodejs
do
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE $? "$package Installation"    
done