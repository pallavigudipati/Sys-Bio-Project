%% Test RWR

% adj_mat = load('data/log_adjmat_ecoli4_thresholded_600');
% adj_mat = adj_mat.adj_matrix;
% [n, e] = rwr(adj_mat, 15);
% save('data/log_rwr_ecoli4_thresholded_600', 'n', 'e');

adj_mat = load('data/log_adjmat_ecoli3_thresholded_600');
adj_mat = adj_mat.adj_matrix;
[n, e] = rwr(adj_mat, 15);
save('data/log_rwr_ecoli3_thresholded_600', 'n', 'e');

adj_mat = load('data/log_adjmat_ecoli2_thresholded_600');
adj_mat = adj_mat.adj_matrix;
[n, e] = rwr(adj_mat, 15);
save('data/log_rwr_ecoli2_thresholded_600', 'n', 'e');

adj_mat = load('data/log_adjmat_ecoli4_thresholded_600');
adj_mat = adj_mat.adj_matrix;
[n, e] = rwr(adj_mat, 15);
save('data/log_rwr_ecoli4_thresholded_600', 'n', 'e');

adj_mat = load('data/log_adjmat_yeast_thresholded_600');
adj_mat = adj_mat.adj_matrix;
[n, e] = rwr(adj_mat, 15);
save('data/log_rwr_yeast_thresholded_600', 'n', 'e');