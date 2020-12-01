function [x,t] = SOR(A,b,omega)
% use SOR to solve Ax = b
% omega is the relaxation parameter

% global constants
tol=1e-6;
MAX_ITER = 1000;

t_start = tic;
n = size(A,1);
L = - tril(A,-1);
U = - triu(A,1);
D = diag(diag(A));

C = inv(D - omega * L);
B = C * ((1 - omega) * D + omega * U);
f = C * omega * b;

x = zeros(n,1);

for i = 1:MAX_ITER
    y = B * x + f;
    e = norm(x-y,2);
    x = y;
    if e < tol
        break;
    end
end

t = toc(t_start);
    
end

