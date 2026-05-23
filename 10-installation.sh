#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "please run this script with root user"
   exit 1
fi

echo "installing nginx"
dnf install nginx -y
