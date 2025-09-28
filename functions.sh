#!/bin/bash

Userid=$(id -u)

if [ $((Userid)) -eq 0 ]; then
    echo "User is the root user"
else
    echo " pls Authenticate as root user"
    exit 1
fi

Validate(){
if [ $1 -ne 0 ]; then
    echo "Installing $2 failed"
    exit 1
else 
    echo "Successfully $2 mysql"
fi
}

dnf install mysql -y
Validate $? "mysql"

dnf install nginx -y
Validate $? "nginx"