#!/bin/bash

NUMBER1=100
NUMBER2=200

#everything in shell is considered as string"

SUM=$(($NUMBER1+$NUMBER2))

echo "Sum of numbers is: ${SUM}"

LEADERS=("MODI" "TRUMP" "PUTIN")
echo "All leaders are: ${LEADERS[@]}"
echo "FIRST LEADER IS: ${LEADERS[0]}"
echo "Tenth leader is: ${{LEADERS[10]}"
