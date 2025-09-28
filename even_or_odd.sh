#!/bin/bash

echo "Enter a number"
read Number
if [ ($Number % 2) -eq 0]; then
    echo "Given number $Number is even"
else
    echo "Given number $Number is odd"
fi