D = 2 * eye(10);
U = diag(-1 * ones(1,9),1);
L = diag(-1 * ones(1,9), -1);
A = D + U + L;

E = eig(A);
J = Jacobi(A);
Q = QR_eig(A);


