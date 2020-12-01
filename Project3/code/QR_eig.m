function [lambda] = QR_eig(A)
% use QR method to compute the eigenvalues of A
tol = 1e-6; MAX_ITER = 10000; 

for i = 1:MAX_ITER
    [Q,R] = qr(A);
    A = R * Q;
    
    if max_nd(A) < tol
        Out = A;   
        lambda = sort(diag(Out));
        break;
    end
end
end

