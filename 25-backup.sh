#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]; then
   echo -e "$R please run this script with root user $N"
   
fi

mkdir -p $LOGS_FOLDER

USAGE(){
      echo -e "$R USAGE: sudo backup <source_dir> <dest_dir> <DAYS> [Default 14 days] $N"
      exit 1
    

}
