% Finds the 'ceiling' of the given set.
% M = Input matrix. Each row is a vector
% x = ceiling vector.
%%
function [x] = set_ceiling(M)
    if size(M, 1) == 1
        x = M;
    else
        x = max(M);
    end
    % display('in ceil');
    % display(x);
end