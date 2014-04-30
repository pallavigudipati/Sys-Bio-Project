%Get unique features in S
new_S = [];

for i = 1 : size(S, 1)
    curr_feature = S(i, :);
    found = 0;
    for j = 1 : size(new_S)
        if new_S(j, :) == curr_feature
            found = 1;
        end
    end
    if found == 0
        new_S = [new_S; curr_feature];
    end
end