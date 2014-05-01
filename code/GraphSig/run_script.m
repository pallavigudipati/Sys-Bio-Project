%% This script is an example to run the pre-processing for a graph in the STRING DB format to the format required further.

parse_graph('ecoli.txt', 1);

names = {'ecoli3_thresholded_600.mat', 'ecoli4_thresholded_600.mat'};
%% Node Label Bins
number_of_bins = 20;
convert_mat
get_adj_matrix
list_of_organisms = {'data/log_adjmat_ecoli3_thresholded_600', 'data/log_adjmat_yeast_thresholded_600'};
list_of_mappings  = {'data/log_mapping_ecoli3_thresholded_600', 'data/log_mapping_yeast_thresholded_600'};
list_of_RWR       = {'data/log_rwr_ecoli3_thresholded_600', 'data/log_rwr_yeast_thresholded_600'};
run_GraphSig