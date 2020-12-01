function [S,P] = GS(f,n)
phi(1) = poly2sym([0,2^(-1/2)]);
astar = zeros(n+1,1); astar(1) = innerP(f,phi(1));
P(1) = phi(1); S = astar(1) * phi(1);

for i = 2:(n+1)
    temp1 = zeros(i,1); temp1(1) = 1; psi = 0;
    for j = 1:(i-1)
        a(i,j) = - innerP(poly2sym(temp1),phi(j));
        psi = psi + a(i,j) * phi(j);
    end
    psi = poly2sym(temp1) + psi;
    phi(i) = psi / sqrt(innerP(psi,psi));
    astar(i) = innerP(f,phi(i));
    S = S + astar(i) * phi(i);
end
P = phi(:);
end

