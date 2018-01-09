#!/bin/bash

# to count files in a directory
# make directory a variable
dir_name=/Users/elenalanigan/Documents/OS/OS_Project/SNMR/files_folder/*

count=0
# set count to equal 0 
# for number of files in directory
# execute map.sh on files
# increment count
for files in $dir_name
do
	./map.sh $files &
	((count++))
done
echo "$count files to MapReduce."

#created - mkfifo - map_pipe
#created - mkfifo - reduce_pipe

finish_count=0
while true; do
	read results < map_pipe
	# echo "received $results" 
	# echo $results >> keys
	if [[ $results = "map finished" ]]; then
		((finish_count++))
	else 
		echo $results >> keys.txt
	fi
	if [[ $finish_count -eq $count ]]; then
		break
	fi
	echo "$finish_count finished"
done
wait
# echo "I am waiting"
cat keys.txt | sort -u > keys.tmp
mv keys.tmp keys.txt
echo "Mapper finished. Time to reduce"
reduce_count=0
while read -r line;
do
	./reduce.sh $line &
	((reduce_count++))
done < keys.txt
reduce_min=0
while true 
do
	read input_Reduce < reduce_pipe
	if [[ $input_Reduce = "reduce finished" ]]
	then
			((reduce_min++))
	else 
		echo $input_Reduce
	fi
	if [[ $reduce_min -eq $reduce_count ]]
	then
		break
	fi
done
wait
echo "Done"
