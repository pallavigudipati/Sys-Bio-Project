function [A] = parse_graph( filename, thres)
    
    %%Read Network
    A = read_mixed_csv(filename, ' ');
    A = A(2:end, :);
    
    C = strsplit(filename, '.');
    organism_name = cell2mat(C(1));
    
    W = cell2mat(A(:, 3));
    X = str2num(W);
    
    if(thres == 1)
        index = (X > 800);
        A = A(index, :);
        organism_name = sprintf('%s', organism_name);
    end
    protein_names = [A(:, 1); A(:, 2)];
    protein_names = sort(protein_names);
    [keySet, last_indices]  = unique(protein_names, 'last');
    [~, first_indices]  = unique(protein_names, 'first');
    frequency_count = last_indices-first_indices+1;
    degree_dist = hist(frequency_count, max(frequency_count));
    h = figure;
    plot(degree_dist);
    xlabel('Degree');
    ylabel('Number of nodes');
    title(sprintf('%s Degree Distribution', organism_name));
    saveas(h, sprintf('%s_deg.png', organism_name), 'png');
    
    %% For the weights
    W = cell2mat(A(:, 3));
    X = str2num(W);
    h = figure;
    weight_distribution = hist(X, (max(X)-min(X)+1));
    plot(min(X):max(X), weight_distribution);
    xlabel('Weights');
    ylabel('Number of edges');
    title(sprintf('%s Weight Distribution', organism_name));
    saveas(h, sprintf('%s_weg.png', organism_name), 'png');
    save(organism_name, 'A');
    close all;
end