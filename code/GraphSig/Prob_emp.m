% Calculates the probability of the given vector occuring in a random
% feature vector.
% M = Whole Database of vectors.
% x = Given vector.
% p = Probability.
%%
function [p] = Prob_emp(x, M)
    %x_ext = repmat(x, size(M, 1), 1);
    %freq = sum(M >= x_ext) ./ size(M, 1);
    product = 1;
    den = size(M, 1);
    for i = 1 : size(x, 2)
        number_greater = sum(M(:, i) >= x(1, i));
        product = product * number_greater/den;
    end
    p = product;
   % display(p);
end