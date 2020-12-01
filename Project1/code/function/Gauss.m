function [x,t] = Gauss(A,b)
% use Gauss elimination to solve Ax = b where A is a square matrix

n = size(A,1);
x = zeros(n,1);
t_start = tic;

% step I
for k = 1 : n - 1
    for i = 1 : k
        A(i,:) = A(i,:);
        b(i) = b(i);
    end
    
    for i = k + 1 : n
        l = A(i,k) / A(k,k);
        A(i,1:k) = 0;
        A(i,k+1:n) = A(i,k+1:n) - l * A(k, k+1:n);
        b(i) = b(i) - l * b(k);
    end
end

% step II
x(n) = b(n) / A(n,n);

for i = n - 1 : -1 : 1
     x(i) = (b(i) - sum(x(i+1:n) .* vec(A(i,i+1:n)))) / A(i,i);
end

t = toc(t_start);
end

