new_node_features = zeros(size(node, 1), 20);
for i = 1 : 20
    new_node_features(:, i) = sum(node(labels == i), 2);
end