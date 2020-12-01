function [I] = pieceLin(X,Y,x)
n = length(X);
for k = 1:(n-1)
    if x >= X(k) && x <= X(k+1)
        I = Y(k)*(x - X(k+1))/(X(k) - X(k+1)) + ...
            Y(k+1)*(x - X(k))/(X(k+1) - X(k));
    else
        continue;
    end
end
end

