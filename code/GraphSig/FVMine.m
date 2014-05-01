% x = Current sub-feature vector.
% S = Supporting set of x.
% b = Current starting position.
% A = Set of all significant sub-feature vectors.
% M = Whole Database
%%
function [A] = FVMine(x, S, b, maxPvalue, minSup, M)
    display(b);
    A = [];
    m = size(M, 2); % Total number of edge types. 15 in our case. 
    p = p_value(x, size(S, 1), M);
    % display(p, 'p_value');
    % display(maxPvalue, 'maxPvalue');
    if  p <= maxPvalue
        % display(p, 'appending');
        A = x;
    end
    
    
    for i = b:m
        S_new = [];
        display(i);
        display(size(S, 1));
        for j = 1:size(S, 1)
            if S(j,i) > x(i)
                % display(S(j,i));
                % display(x(i));
                S_new = vertcat(S_new, S(j,:));
            end
        end
        if size(S_new,1) < minSup
            continue;
        end
        % display(size(S_new, 1), 'minSup');
        x_new = set_floor(S_new);
        flag = 0;
        for j = 1 : i-1
           if x_new(j) > x(j)
               flag = 1;
               break;
           end
        end
        if flag == 1
            continue;
        end
        p_new = p_value(set_ceiling(S_new), size(S_new, 1), M);
        if  p_new >= maxPvalue
            % display(p_new, 'p_value fail');
            continue;
        end
        %display(p_new, 'p_value pass');
        A_cat = FVMine(x_new, S_new, i, maxPvalue, minSup, M);
        A = vertcat(A, A_cat);
    end
end