function [node_features, edge_features] = rwr(adj_matrix, sws)
% Performs Random Walk with restart on the given adj_matrix, and given sliding window size
% mapping maps the node to type
    
    number_of_types = 20;
    feature_size = nchoosek(number_of_types, 2) + number_of_types;
    number_nodes = size(adj_matrix, 1);
    node_features = zeros(number_nodes, number_nodes);
    edge_features = zeros(number_nodes, feature_size);

    bool_adj = double(adj_matrix  > 0);
    normalize_constants = sum(bool_adj);
    trans_mat = bool_adj./repmat(normalize_constants, number_nodes, 1);

    % Edge Transistion matrix
    edge_trans_mat = zeros(number_nodes, feature_size);
    for j = 1 : feature_size
        counts = sum(adj_matrix == j);
        edge_trans_mat(:, j) = counts';
    end
    normalize_constants = sum(edge_trans_mat);
    zero_indices = (normalize_constants==0);
    normalize_constants(zero_indices) = 1;
    edge_trans_mat = edge_trans_mat./(repmat(normalize_constants, number_nodes, 1));

    %Choosing a restart probability which gives and expected window size of
    %'sws'
    restart_prob = 1/sws;

    %% Iterate over each node, and calulate the corresponding feature vectors
    for i = 1 : number_nodes
        old_node_f = zeros(number_nodes, 1);
        new_node_f = old_node_f;
        new_node_f(i, 1) = 1;
        init_node_f = new_node_f;
        curr_edge_f = zeros(1, feature_size);
        while(converged(old_node_f, new_node_f) ~= 1)
            old_node_f = new_node_f;
            new_node_f = (1-restart_prob)*trans_mat*old_node_f + restart_prob*init_node_f;
            curr_edge_f = curr_edge_f + new_node_f'*edge_trans_mat;            
            normalize_constants = sum(curr_edge_f);            
            if normalize_constants == 0
                normalize_constants = 1;
            end
            curr_edge_f = curr_edge_f./normalize_constants;
        end
        node_features(i, :) = new_node_f;
        edge_features(i, :) = curr_edge_f;
    end
    
%% Converting to a discrete distribution
    range = max(max(edge_features));
    number_of_bins = 20;
    for i = 1 : number_of_bins
        lower_bound = (i-1)*range/number_of_bins;
        upper_bound = (i)*range/number_of_bins;
        edge_features((lower_bound <= edge_features) & (edge_features <= upper_bound)) = (i-1);
    end
end

function [c] = converged(oldu, newu)
    delta = 10^-5*ones(size(oldu,1 ), size(oldu, 2));
    if(size(newu, 1) ~= size(oldu, 1) || size(newu, 2) ~= size(oldu, 2))
        display('Error');
    end
    if (abs(newu-oldu) < delta)
        c = 1;
    else
        c = 0;
    end
end