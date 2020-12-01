function [x,t] = GMRES(A,b,m)

MAX_ITER = 1000;
tol = 1e-9;
t_start = tic;

n = size(A,1);
x0 = zeros(n,1);
r0 = b - A * x0;


for k = 1:MAX_ITER
    beta = norm(r0,2);
    v1 = r0 / beta;
    
    % Arnoldi process
    [V,H] = Arn(A,m,v1);

    % solve least square problem
    temp = zeros(m+1,1);
    temp(1) = 1;
    y = H \ (beta * temp);
    x = x0 + V(:,1:m) * y;
    r = b - A * x;
    r0 = r;
    if norm(r,2) < tol
        break;
    else
        x0 = x;
    end
end

t = toc(t_start);
end