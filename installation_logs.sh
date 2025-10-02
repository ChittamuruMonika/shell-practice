#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

Log_Folder="/var/logs/shell-script"
Script_Folder=$( echo $0 | cut -d "." -f1 )
Log_File="$Log_Folder/$Script_Folder.log"

mkdir -p $Log_Folder

if [ $((id -u)) -ne 0 ]; then
    echo "$R Error: please run the script with root privilege $N"
    exit 1
fi


Validate(){
    if [ $1 -ne 0 ]; then
        echo -e "Installing $2...$R Failure $N"
    else
        echo -e "Installing $2...$G Success $N"
    fi
}

dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    Validate $? "mysql"
else
    echo -e "mysql already installed...$Y Skipping $N"
fi

dnf list installed nginx
if [ $? -ne 0 ]; then
    dnf install nginx -y
    Validate $? "nginx"
else
    echo -e "nginx already installed...$Y Skipping $N"
fi

