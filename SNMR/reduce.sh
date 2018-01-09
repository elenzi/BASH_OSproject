#!/bin/bash

count=0
while read -r line;
do
		((count++))
done < $1
# ./p_reduce.sh reduce_pipe 
echo "$1 $count" > reduce_pipe
sleep 1
echo "reduce finished" > reduce_pipe
# ./v_reduce.sh reduce_pipe


