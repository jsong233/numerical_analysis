function [x,t] = Chol(A,b)
% use Cholesky decomposition to solve Ax = b
% where A is a symmetric matrix

n = size(A,1);
x = zeros(n,1);
y = zeros(n,1);
L = zeros(n,n);
t_start = tic;

% step I
for j = 1:n
    L(j,j) = sqrt(A(j,j) - sum((L(j,1:j-1)).^2));
    %for i = j + 1 : n
        %L(i,j) = (A(i,j) - sum(vec(L(i,1:j-1)) .* vec(L(j,1:j-1)))) / L(j,j);
    %end
    L(j+1:n,j) = (A(j+1:n,j) - L(j+1:n,1:j-1) * vec(L(j,1:j-1))) / L(j,j);
end

% step II
for i = 1:n
    y(i) = (b(i) - sum(vec(L(i,1:i-1)) .* y(1:i-1))) / L(i,i);
end 

for i = n : -1 : 1
    x(i) = (y(i) - sum(vec(L(i+1:n,i)) .* x(i+1:n))) / L(i,i);
end

t = toc(t_start);
end
