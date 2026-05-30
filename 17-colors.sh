#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
       echo "$package is not installed and installing now"
       dnf install $package -y &>> $LOGS_FILE
       VALIDATE $? "$package Installation"
  else
      echo -e "$package already installed skip for now $Y SKIPPING $N"
  fi    
done