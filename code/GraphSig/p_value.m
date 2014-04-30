% Calculates he p-value of the given vector.
% p = p_value.
% x = Given vector.
% mu = Observed support of the vector.
% M = Whole Database.
%%
function [p] = p_value(x, mu, M)
   m = size(M, 1); % Total number of vectors in Database.
   %index = linspace(mu, m, m - mu + 1);
   % TODO Take care of the vector as seconf arg.
  
   p = betainc(Prob_emp(x, M), mu, m);
   %p = 0;
   % for i = mu:m
    %    p_part = Prob(x, i, M); 
     %   p = p + p_part;
      %  display(p_part);
    %end
end