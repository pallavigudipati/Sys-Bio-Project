#!/bin/bash

echo "Number of nodes: "
read num_nodes
echo "Support threshold(in percent) "
read support

python format.py

file_name="node_label"
for i in $(seq 1 $num_nodes)
do 
	new_file_name=$file_name$i
	new_file_name+="_fsg"
	./fsg -x -t -s $support $new_file_name
done

mkdir fp
mkdir pc
mkdir tid_files
mv *.fp fp/.
mv *.pc pc/.
mv *.tid tid_files/.
python get_features.py
python get_distances.py > final_output.txt
