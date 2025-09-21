#!/bin/bash

NUMBER1=100
NUMBER2=200

#everything in shell is considered as string"

SUM=$(($NUMBER1+$NUMBER2))

echo "Sum of numbers is: ${SUM}"

LEADERS=("MODI" "PUTIN" "TRUMP")
echo "All leaders are: $LEADERS[@]"
