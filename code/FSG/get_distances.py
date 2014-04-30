import pickle
import csv
import json
from os import listdir
from os.path import isdir, isfile, join
from collections import OrderedDict

def distance(orgi, orgj, feat_dict):
	orgi_feats = feat_dict[orgi]
	orgj_feats = feat_dict[orgj]
	dist = 0.0
	for feat in orgi_feats.keys():
		dist += pow((orgi_feats[feat] - orgj_feats[feat]), 2)
	return pow(dist, 0.5)


features_dict = pickle.load(open("features_dict", "rb"))
for orgi in features_dict.keys():
	for orgj in features_dict.keys():
		dist = distance(orgi, orgj, features_dict)
		print orgi, orgj, dist
