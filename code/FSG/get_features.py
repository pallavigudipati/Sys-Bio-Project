import pickle
import csv
import json
from os import listdir
from os.path import isdir, isfile, join
from collections import OrderedDict

node_dict = pickle.load(open("node_dict", "rb"))
#print node_dict

path = "tid_files"
files = [f for f in listdir(path) if isfile(join(path, f))]
#print files

features_dict = OrderedDict({'org_1':{}, 'org_2':{}, 'org_3':{}, 'org_4':{}})
for f in files:
	path_1 = join(path, f)
	fp = open(path_1, "r")
	data = fp.read();
	fp.close()

	subgraphs = data.split('\n')
#print subgraphs
#	print "#########"
	node_name = (f.rsplit('_',1))[0]
	for sub in subgraphs:
		if (sub != ''):
			tids = sub.split(" ")
			feature_name = node_name + '_' + str(tids[0])
			tids.remove(tids[0])
			org_no = 1
			total = 0
			org = 'org_' + str(org_no)
#			print tids
			for tid in tids:
#				print node_name
#				print tid
#				print total + (node_dict[node_name])[org]
				if (int(tid) <= total + int((node_dict[node_name])[org] - 1)):
					if (feature_name in features_dict[org]):
						(features_dict[org])[feature_name] += 1
					else:
						(features_dict[org])[feature_name] = 1
#					print "#" + org
				else:
				  	total += int((node_dict[node_name])[org])
					org_no += 1
					org = 'org_' + str(org_no)
					(features_dict[org])[feature_name] = 1
#print org

#print features_dict
print(json.dumps(features_dict, indent=4))
pickle.dump(features_dict, open("features_dict", "wb"))
