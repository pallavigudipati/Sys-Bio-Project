% Run Graph Sig
number_of_organisms = 1;
G = cell(number_of_organisms);
mappingList = cell(number_of_organisms);
list_of_organisms = {'data/log_adjmat_ecoli_thresholded_2'};
list_of_mappings  = {'data/log_mapping_ecoli_thresholded_2'};

for org = 1 : number_of_organisms
    adj_mat = load(list_of_organisms{org});
    map    = load(list_of_mappings{org});   
    adj_mat = adj_mat.adj_matrix;
    map    = map.mapping;
    G{org} = adj_mat;
    mappingList{org} = map;
end

% Turning off WARNINGS. But need to take care of it.
warning('off', 'MATLAB:nchoosek:LargeCoefficient');
GraphSig( G, 0.1, 0.0001, mappingList )