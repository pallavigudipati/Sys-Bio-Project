% Calculates the probability of the given vector having the given support.
% p = Probability.
% x = Given vector.
% mu = Given Support.
% M = Whole database
%%
function [p] = Prob(x, mu, M)
    m = size(M, 1); % Total number of vectors in database
    p_emp = Prob_emp(x, M);
    p = nchoosek(m, mu) * (p_emp ^ mu) * ((1 - p_emp) ^ (m - mu));
end