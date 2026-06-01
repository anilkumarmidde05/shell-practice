#!/bin/bash
USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="/var/log/shell-script/backup.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-1} # 14 day is the default value if the user is not supplied

if [ $USERID -ne 0 ]; then
   echo -e "$R please run this script with root user $N"
   
fi

mkdir -p $LOGS_FOLDER

USAGE(){
      echo -e "$R USAGE: sudo backup <source_dir> <dest_dir> <DAYS> [Default 14 days] $N"
      exit 1
    

}

log(){

    echo -e "$(date "+%Y -%m -%d %H:%M:%S") | $1" | tee -a $LOGS_FILE

}
if [ $# -lt 2 ]; then
    USAGE
fi

if [ ! -d $SOURCE_DIR ]; then
 echo -e "$R Source directory:  $SOURCE_DIR is doesnt exist $N"
 exit 1
 fi

if [ ! -d $DEST_DIR ]; then
   echo -e "$R Destination directory: $DEST_DIR is doesnt exist $N"
   exit 1
fi


# find the files
FILES=$(find $SOURCE_DIR -name "*.log" -type f -mtime +$DAYS)

log "Back-up started"
log "Source directory: $SOURCE_DIR"
log "Destination directory: $DEST_DIR"
log "Number of days: $DAYS"

# verify if any files to zip

if [ -z "$FILES" ]; then
 log "no files to archive...$Y SKIPPING $N"
else
 # app-logs-$timestamp.zip
 log "file found to archive: $FILES"
 TIMESTAMP=$(date +%F-%H-%M-%S)
 ZIP_FILE_NAME="$DEST_DIR/app-logs-$TIMESTAMP.tar.gz"
 echo "Archieve Name: $ZIP_FILE_NAME"

fi
