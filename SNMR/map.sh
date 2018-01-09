#!/bin/bash

# variable to find
mapfiles=`cat $1 | cut -d',' -f2`
# variable to sort
key=`cat $1 | cut -d',' -f2 | sort -u`
# echo $key 

echo "In the map"
# ./p_file.sh $file
for line in $mapfiles; do 
        echo "$line 1" >> $line      
done
# ./v_file.sh $file

# ./p_key.sh map_pipe
echo $key > map_pipe
sleep 1
echo "map finished" > map_pipe
# ./v_key.sh map_pipe


