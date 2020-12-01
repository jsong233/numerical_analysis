function [I] = GLint(f,a,b,n)
h = 2/n; t0 = -1; x0 = a;
P = Legendre(n+1);
Q1 = sym2poly(P(n)); 
Q2 = sym2poly(diff(P(n+1))); 
A0 = 2/((n+1) * polyval(Q1,t0) * polyval(Q2,t0));
t = roots(sym2poly(P(n+1)));t = t(2:n+1); 
for k = 1:n
    x(k) = (a+b)/2 + ((b-a)*t(k))/2; 
    A(k) = 2/((n+1) * polyval(Q1,t(k)) * polyval(Q2,t(k)));
end
I = A0 * f(x0);
for k = 1:n
    I = I + A(k)*f(x(k));
end
I = I * (b-a) / 2;
end

