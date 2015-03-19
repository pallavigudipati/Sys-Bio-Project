% Run Graph Sig
% list_of_organisms = {'data/log_adjmat_ecoli3_thresholded_600', 'data/log_adjmat_ecoli4_thresholded_600', 'data/log_adjmat_ecoli1_thresholded_600', 'data/log_adjmat_ecoli2_thresholded_600'};
% list_of_mappings  = {'data/log_mapping_ecoli3_thresholded_600', 'data/log_mapping_ecoli4_thresholded_600', 'data/log_mapping_ecoli1_thresholded_600', 'data/log_mapping_ecoli2_thresholded_600'};
% list_of_RWR       = {'data/log_rwr_ecoli3_thresholded_600', 'data/log_rwr_ecoli4_thresholded_600', 'data/log_rwr_ecoli1_thresholded_600', 'data/log_rwr_ecoli2_thresholded_600'};
number_of_organisms = size(list_of_organisms, 2);
G = cell(number_of_organisms, 1);
mappingList = cell(number_of_organisms, 1);
RWRList     = cell(number_of_organisms, 1);


for org = 1 : number_of_organisms
    adj_mat = load(list_of_organisms{org});
    map    = load(list_of_mappings{org});   
    rwr    = load(list_of_RWR{org});   
    adj_mat = adj_mat.adj_matrix;
    map    = map.mapping;
    G{org} = adj_mat;
    mappingList{org} = map;
    RWRList{org} = rwr;    
end

% Turning off WARNINGS. But need to take care of it.
warning('off', 'MATLAB:nchoosek:LargeCoefficient');
GraphSig( G, RWRList, 0.001, 0.01,  mappingList )