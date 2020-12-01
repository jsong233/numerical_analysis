function [S] = spline3(X,Y,m_1,m_n,x)
n = length(X); b = zeros(n-2,1);
for j = 2:n
    h(j) = X(j) - X(j-1);
end
for j = 2:n-1
    lambda(j) = h(j+1) / (h(j) + h(j+1)); mu(j)= 1 - lambda(j);
end
for j = 2:n-1
    g(j) = 3 * (lambda(j)*(Y(j) - Y(j-1))/(X(j) - X(j-1)) + mu(j)*(Y(j+1) - Y(j))/(X(j+1) - X(j)));
end
b(1) = g(2) - lambda(2)*m_1; b(n-2) = g(n-1) - mu(n-1)*m_n; b(2:n-3) = g(3:n-2); 
A = 2 * eye(n-2) + diag(mu(2:n-2),1) + diag(lambda(3:n-1),-1); %生成三对角系数矩阵
m(2:n-1) = inv(A) * b; m(1) = m_1; m(n) = m_n; %解得m
for k = 1:n-1
    if x >= X(k) && x <= X(k+1)
        p = (x - X(k+1))^2/(h(k+1))^2; q = (x - X(k))^2/(h(k+1))^2; 
        S = Y(k)*(1+2*(x - X(k))/h(k+1))*p + Y(k+1)*(1 - 2*(x-X(k+1))/h(k+1))*q +...
            m(k)*(x - X(k))*p + m(k+1)*(x-X(k+1))*q;
    else, continue;
    end
end
end

