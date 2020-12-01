function [I] = Romberg(f,a,b,tol)
k = 1; err = 1; 
T(1,1) = ((b-a)/2) * (f(a)+f(b));  
while err >= tol 
    k = k + 1; n = 2^(k-1); h = (b-a)/n; H = f((a+b)/2);
    for i = 1:(n/2)  
        H = H + f(a + (2*i - 1) * h);  
    end  
    T(k,1) = (T(k-1,1) + 2*h*H) / 2; 
    for j = 2:k  
        T(k+1-j,j) = (4^(j-1)*T(k+2-j,j-1) - T(k+1-j,j-1)) / (4^(j-1) - 1);
    end  
    err = abs(T(k,1) - T(k-1,1));  
end  
I = T(k,1);
end

