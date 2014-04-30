%% Cut the graph, or radius r, in a given graph G around nodes i.
function [] = graph_cut(G, node_list, radius, path)    
    display(sum(node_list))
    for node_num = 1 : size(node_list, 1)
        if node_list(node_num) == 1
            % curr_path = strcat(path, '/', sprintf('%d.csv', node_num));
            curr_path = fullfile(path, sprintf('%d.csv', node_num));
            cut_graph = G;
            [dist_list] = bfs(G,node_num);
            dist_list = ~(dist_list < radius);
            cut_graph(dist_list, :) = zeros(sum(dist_list), size(cut_graph, 2));
            cut_graph(:, dist_list) = zeros(size(cut_graph, 1), sum(dist_list));
            dist_list = ~dist_list;
            new_graph = cut_graph(dist_list, dist_list);
            display(curr_path);
            csvwrite(curr_path, full(new_graph));
        end
    end
end