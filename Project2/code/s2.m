function [x] = s2(x0,tol)
MAX_ITER = 1000;
x = x0;

for k = 1:MAX_ITER
    funcx = fun2(x);
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

