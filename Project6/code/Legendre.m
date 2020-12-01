function [P] = Legendre(n)
p0 = 1;
p{1} = poly(0);
p{2} = [3/2 0 -1/2];

for k = 3:n
    p{k} = sym2poly(poly2sym(((2*k-1)/k) .* conv(poly(0),p{k-1})) ...
        - poly2sym(((k-1)/k) .* p{k-2}));
end

for j = 1:n
    P(j) = poly2sym(p{j});
end
end

