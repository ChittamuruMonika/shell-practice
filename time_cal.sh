#!/bin/bash

#DATE=$(date)

#echo "Timestamp is : $DATE"

start_time=$(date +%s)
sleep 10
end_time=$(date +%s)
Total_time=$(($end_time-$start_time))
echo "start_time is:$start_time"
echo "end_time is:$end_time"
echo "Total time is:$Total_time seconds" 