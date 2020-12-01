f = @(x)sin((2*pi)./x) ./ x.^2;
a = 1; b = 3; n = 4; tol = 1e-7;
I_GL = GLint(f,a,b,n);
I_R = Romberg(f,a,b,tol);

