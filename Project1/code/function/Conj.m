function [x,t] = Conj(A,b)
% use conjugate gradient descent to solve Ax = b

tol = 1e-9;

t_start = tic;
n = size(A,1);
x0 = rand(n,1);
r = b - A * x0;
p = r;
rrold = r' * r;

for i = 1:n
    Ap = A * p;
    alpha = rrold / (p' * Ap);
    x1 = x0 + alpha * p;
    r = r - alpha * Ap;
    rrnew = r' * r;
    beta = rrnew / rrold;
    p = r + beta * p;
    
    rrold = rrnew;
    x0 = x1;
    if sqrt(rrnew) < tol
        break;
    end
end

x = x0;
t = toc(t_start);

if i == n
    sprintf('Conjugate Gradient Descent does not converge.');
end
end

