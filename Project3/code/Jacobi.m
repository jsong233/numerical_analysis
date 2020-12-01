function [lambda] = Jacobi(A)
% use Jacobi method to compute the eigenvalues of A
tol = 1e-6; MAX_ITER = 10000; n = size(A,1);

for i = 1:MAX_ITER
    [a,k,l] = max_nd(A);
    if a < tol
        Out = A;   
        lambda = sort(diag(Out));
        break;
    end
    
    if A(k,k) == A(l,l)
        theta = pi/4; cos1 = cos(theta); sin1 = sin(theta);
    else
        tan2 = (2*A(k,l))/(A(k,k)-A(l,l)); [cos1,sin1] = cs(tan2);
    end
    
    J = Givens(k,l,cos1,sin1,n);
    A = J * A * inv(J);
end

if i == MAX_ITER
    sprintf('Algorithm does not converge.')
end
end

