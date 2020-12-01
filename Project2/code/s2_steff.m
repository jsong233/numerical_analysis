function [x] = s2_steff(x0,tol)
MAX_ITER = 1000;
x = x0;

for k = 1:MAX_ITER
    y = fun2(x);
    z = fun2(y);
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

