#!/bin/bash

#TIMESTAMP=$(date)

#echo "script exectuted at: $TIMESTAMP"

###########################

START_TIME=$(date +%s)
echo "script executed at: $START_TIME"
 
 sleep 10
 END_TIME=$(date +%s)
TOTAl_TIME=$(($END_TIME-$START_TIME))
echo "total time is: $TOTAL_TIME seconds"