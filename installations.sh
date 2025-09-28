#!/bin/bash

Userid=$(id -u)

if [ $((Userid)) -eq 0 ]; then
    echo "User is the root user"
else
    echo " pls Authenticate as root user"
    exit 1
fi

dnf instal mysql -y

if [ $? -eq 0]; then
    echo "my sql installed successfully"
else 
    echo "failed to instal mysql"