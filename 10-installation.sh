#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "please run this script with root user"
   exit 1
fi

echo "installing nginxxx"
dnf install nginx -y
if [ $? -ne 0 ]; then
   echo "installing ngix ...failure"
   exit 1
else
   echo "Installing Nginx ....success"
fi
