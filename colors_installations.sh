#!/bin/bash

Userid=$(id -u)

if [ $((Userid)) -eq 0 ]; then
    echo "User is the root user"
else
    echo " pls Authenticate as root user"
    exit 1
fi

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Validate(){
if [ $1 -ne 0 ]; then
    echo "Installing $2 failed"
    exit 1
else 
    echo "Successfully $2 is installed"
fi
}

dnf list installed mysql -y
if [ $? ne 0 ]; then
    dnf install mysql -y
    Validate $? "mysql"
else
    echo -e "Mysql already exist ... $Y skipping $N"
fi

dnf list installed nginx -y
if [ $? ne 0 ]; then
    dnf install nginx -y
    Validate $? "nginx"
else
    echo -e "nginx already exist ... $Y skipping $N"
fi