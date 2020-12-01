function [cos1,sin1] = cs(tan2)
% use tan2x to compute cosx and sinx
cos2 = sqrt(1/(1 + tan2^2));
cos1 = sqrt((cos2 + 1)/2);
sin1 = sqrt(1 - cos1^2);
end

