#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[32m"
N="\e[0m"

Log_Folder="/var/log/shell-script" 
Script_Name=$( echo $0 | cut -d "." -f1 )
Log_File="$Log_File/$Script_Name.log"
mkdir -p $Log_Folder

if ( $USERID -ne 0 ); then 
    echo -e "$R Error: please run the script with root privilege $N"
    exit 1
fi

Validate() {
    if ( $1 -ne 0 ); then
        echo -e "Installing $2.....$R Failed $N" | tee -a $Log_File
        exit 1
    else
        echo -e "Installing $2.....$G Success $N" | tee -a $Log_File
    fi
}

for package in range $@
do 
    dnf list installed $package &>>$Log_File
    if ( $? -ne 0 ); then
        dnf install $package -y &>>$Log_File
        Validate $? "$package"
    else
        echo -e "$package already installed...$Y Skipping" | tee -a $Log_File
    fi
done