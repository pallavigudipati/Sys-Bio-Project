function [ A ] = GraphSig( G, minSupport, maxPvalue, mappingList )
%GraphSig Implementation of the graphsig algorithm
%   G - Graph Database - list of adjacency matrices
%%%%%%%%%%%%%%%% change vert_iter etc in format.py
    D = [];
    A = [];
    labels = [];
    number_of_organisms = size(G, 2);
    graph_cut_radius = 3;
    bool_graph_list = cell(number_of_organisms);
    feature_size = 210;
    for i = 1 : number_of_organisms
        [node, e] = rwr(cell2mat(G(i)), 15);
        bool_graph_list{i} = double(cell2mat(G(i)) > 0);
        %D = [D; node];
        D = [D; e];
        labels = [labels; cell2mat(mappingList(i))];
    end
    path = '';
    %% For each node type 
    order = [5, 4, 3, 2, 1];
    for i = 1 : 20        
        %i = order(1, iter);
        path = sprintf('node_label%d', i);            
        mkdir(path);
        Da = D(labels==i, :);
        % minSup should not be between 0 and 1
        S = FVMine(set_floor(Da), Da, 1, 0.1, ceil(0.0001 * size(Da, 1)), Da);
        display(size(S));
        % Now we have mined significant features from the graph
        % corresponding to all nodes of type i
        for j = 1 : size(S, 1)
            floor_v = S(j, :);
            %This node_index will give a binary array of size of N_a, whose
            %indices corresponding to the full graph can be extracted from
            %labels array
            comp_mat = (repmat(floor_v, size(D, 1), 1) <= D);
            comp_mat = sum(comp_mat, 2);
            comp_mat = (comp_mat == feature_size);
            node_index =  comp_mat &  (labels==i);            
            E = {};
            start_index = 1;
            for k = 1 : number_of_organisms
                % path_o = strcat(path, '/', sprintf('org_%d', k));
                path_o = fullfile(path, sprintf('org_%d', k));
                mkdir(path_o);
                end_index = start_index + size(cell2mat(G(k)), 1) - 1;
                curr_graph_indices = node_index(start_index:end_index, 1);
                graph_cut(cell2mat(bool_graph_list(k)), curr_graph_indices, graph_cut_radius, path_o);
                %E = [E cut_graph(G(k), curr_graph_indices, graph_cut_radius)];
                %start_index = end_index + 1;
            end
        end
    end
end

