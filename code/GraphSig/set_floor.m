% Finds the 'floor' of the given set.
% M = Input matrix. Each row is a vector
% x = floor vector.
%%
function [x] = set_floor(M)
    if size(M, 1) == 1
        x = M;
    else
        x = min(M);
    end
    % display('in set floor');
    % display(M);
    % display(x);
end