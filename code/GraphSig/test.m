%% Test RWR
adj_mat = load('adjmat_ecoli_thresholded');
adj_mat = adj_mat.adj_matrix;
[n, e] = rwr(adj_mat, 15);