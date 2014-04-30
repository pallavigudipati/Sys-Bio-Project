%% Convert to Adjacency Matrix
%names = {'ecoli_thresholded_2.mat' , 'flatworm_thresholded_2.mat','pencillin_thresholded_2.mat', 'speherobacter_thresholded_2.mat', 'yeast_thresholded_2.mat'};
names = {'ecoli_thresholded_2.mat'};

number_of_bins = 20;
% 
% symbol_map =  [];
% counter = 1;
% for i = 1:1:number_of_bins
%     for j = i:1:number_of_bins
%         symbol_map(i, j) = counter;
%         symbol_map(j, i) = counter;
%         counter = counter+1;
%     end
% end
% csvwrite('symbol_map.csv', symbol_map);


for i = 1:size(names, 2)
    A = load(cell2mat(names(i)));
    A = A(1).A;
    node_list = [A(:, 1); A(:, 2)];
    protein_names = [A(:, 1); A(:, 2)];
    load(sprintf('data/log_mapping_%s', cell2mat(names(i))));
    protein_names = sort(protein_names);
    edge_list = [A(:, 3)];
    [keySet, ~]  = unique(protein_names, 'last');
    adj_matrix = sparse(zeros(size(unique(protein_names), 1), size(unique(protein_names), 1)));
    number_edges = size(edge_list);
    display(i);
    for e = 1 : 1 : number_edges
        indx1 = strcmp(keySet, A(e, 1));
        indx2 = strcmp(keySet, A(e, 2));
        type1 = mapping(indx1);
        type2 = mapping(indx2);
        adj_matrix(indx1,indx2) = symbol_map(type1, type2);
    end
    
    save(sprintf('data/log_adjmat_%s', cell2mat(names(i))), 'adj_matrix');
end