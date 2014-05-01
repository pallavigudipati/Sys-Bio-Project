% Create the mapping for the given graph mat's 
for i = 1:size(names, 2)
    A = load(cell2mat(names(i)));
    A = A(1).A;
    node_list = [A(:, 1); A(:, 2)];
    protein_names = [A(:, 1); A(:, 2)];
    protein_names = sort(protein_names);
    [keySet, last_indices]  = unique(protein_names, 'last');
    [jaySet2, first_indices]  = unique(protein_names, 'first');
    frequency_count = last_indices-first_indices+1;
    frequency_count = log(frequency_count);
    degree_dist = hist(frequency_count, max(frequency_count));
    display(sprintf('Min : %d, Max: %d', min(frequency_count), max(frequency_count)));
    range = max(frequency_count) - min(frequency_count);
    [sorted_deg, reordered_indices] = sort(frequency_count);
    mapping = zeros(size(keySet));
    range = size(reordered_indices, 1);
    for j = 1 : number_of_bins        
%         lower_bound = (j-1)*(range)/number_of_bins;
%         upper_bound = j*(range)/number_of_bins;
%         display(upper_bound - lower_bound);
%         indices = ( (lower_bound+min(frequency_count)) <= frequency_count) & (frequency_count <= (upper_bound+max(frequency_count)));
%         mapping((indices)) = j;
          lower_bound = (j-1) * ceil((range)/number_of_bins);
          upper_bound = (j) * ceil((range)/number_of_bins);
          if upper_bound < range
            mapping(reordered_indices(lower_bound+1:upper_bound)) = j;
          else
            mapping(reordered_indices(lower_bound+1:range)) = j;
          end
    end
    %save(sprintf('mapping_%s', cell2mat(names(i))), 'mapping');
    save(sprintf('data/log_mapping_%s', cell2mat(names(i))), 'mapping');
end