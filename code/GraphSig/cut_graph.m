% M = Input matrix.
% N = Array of nodes indices.
% r = Radius of the sub-graph. ( r >= 1 )
% O = Ouput 3d array of relevant subgraphs. The first node is node of
% focus.
%%
function [O] = cut_graph(M, N, r)
    O = cell(size(N, 1), 1);
    for i = 1:size(N, 1)
        nodes_at_r = horzcat(N(i), get_nodes(M, N(i), r));
        nodes_at_r = unique(nodes_at_r);
        O(i) = M(nodes_at_r, nodes_at_r);
    end
end

%%
% M = Input matrix.
% index = Index of the given node.
% r = Depth.
% Nodes = Array of nodes.
function[Nodes] = get_nodes(M, index, r)
    next_level = find(M(index, :) == 1);
    Nodes = next_level;
    if r == 1
        return
    end
    for i = 1:size(next_level, 2)
        Nodes = horzcat(Nodes, get_nodes(M, next_level(i), r - 1));
    end
    % Nodes = unique(Nodes); --> Doing this above.
end