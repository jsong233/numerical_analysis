function [x] = Newton(x0,tol)
MAX_ITER = 1000;
x = x0;

for k = 1:MAX_ITER
    x = x - fun3(x) / dfun3(x);
    
    if abs(fun3(x)) < tol
        break;
    end
end

if k == MAX_ITER
    sprintf('Algorithm does not converge.');
end
x = vpa(x,8);
end

