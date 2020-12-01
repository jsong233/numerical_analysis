function [x] = s1_steff(x0,tol)
MAX_ITER = 1000;
x = x0;

for k = 1:MAX_ITER
    y = fun1(x);
    z = fun1(y);
    funcx = x - (y-x)^2 / (z - 2*y + x);
    
    err = abs(x - funcx);
    x = funcx;
    
    if err < tol
        break;
    end
end

if k == MAX_ITER
    sprintf('Algorithm does not converge.');
end
x = vpa(x,8);
end

