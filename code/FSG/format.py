import csv
import pickle
from os import listdir
from os.path import isdir, isfile, join
from collections import OrderedDict

def process(data):
	data_out = "t\n"
	vertices = ""
	edges = ""
	for row in data:
		vertices += "v " + str(data.line_num - 1) + " V\n"
		vert_iter = 0
		for edge in row:
#print data.line_num
			if (data.line_num - 1 <= vert_iter) and (edge == "1"):
				edges += "u " + str(data.line_num - 1) + " " + str(vert_iter) + " E\n"
			vert_iter = vert_iter + 1
	data_out += vertices + edges
	return data_out


path = "."
files = [f for f in listdir(path) if isdir(join(path, f))]
#print files
node_dict = OrderedDict()
files.sort()

for f in files:
	outputfp = open(f + "_fsg", "w")
	path_1 = join(path, f)
	files_1 = [g for g in listdir(path_1) if isdir(join(path_1, g))]
	files_1.sort()
	print files_1
	org_dict = OrderedDict()
	for g in files_1:
		path_2 = join(path_1, g)
		files_2 = [h for h in listdir(path_2) if isfile(join(path_2, h))]
		files_2.sort()
		print files_2
		org_dict[g] = len(files_2)
		for h in files_2:
			inputfp = open(join(path_2, h), "r")
			data = csv.reader(inputfp)
			data_modified = process(data)
			outputfp.write(data_modified)
			inputfp.close()
	outputfp.close()
	node_dict[f] = org_dict
print node_dict
pickle.dump(node_dict, open("node_dict", "wb"))
