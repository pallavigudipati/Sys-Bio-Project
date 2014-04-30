    order = [5, 4, 3, 2, 1];
    for iter = 1 : 5        
        i = order(1, iter);
        path = sprintf('node_label%d', i);            
        mkdir(path);
        Da = D(labels==i,  :);
        S = FVMine(set_floor(Da), Da, 1, maxPvalue, 0.01*size(Da, 1), Da);
        extract_unique_features;
        S = new_S;
        display(size(S, 1));
        % Now we have mined significant features from the graph
        % corresponding to all nodes of type i
        for j = 1 : size(S, 1)
            floor_v = S(j, :);
            display(j);
            %This node_index will give a binary array of size of N_a, whose
            %indices corresponding to the full graph can be extracted from
            %labels array
            comp_mat = (repmat(floor_v, size(D, 1), 1) <= D);
            comp_mat = sum(comp_mat, 2);
            comp_mat = (comp_mat == 15);
            node_index =  comp_mat &  (labels==i);            
            E = {};
            start_index = 1;
            for k = 1 : number_of_organisms
                path_o = strcat(path, '/', sprintf('org_%d', k));
                mkdir(path_o);
                end_index = start_index + size(cell2mat(G(iter)), 1) -1;
                curr_graph_indices = node_index(start_index:end_index, 1);
                graph_cut(cell2mat(bool_graph_list(k)), curr_graph_indices, graph_cut_radius, path_o);
                %E = [E cut_graph(G(k), curr_graph_indices, graph_cut_radius)];
                %start_index = end_index + 1;
            end
        end
        % A = A + MaximalFS
    end
