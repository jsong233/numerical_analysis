function [L] = Lagrange(X,Y)
n = length(X); 
L = ones(n,n);

for k = 1 : n
    P = 1;
    for i = 1 : n
        if k ~= i
            P = conv(P, poly(X(i)) / (X(k) - X(i)));
        end
    end
    l(k) = poly2sym(P);
end
L = Y * vec(l);
end

