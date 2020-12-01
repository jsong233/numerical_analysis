% global constants
M = 20;
omega = 1;

% initialization
er_G = zeros(M,1);
er_C = zeros(M,1);
er_sor = zeros(M,1);
er_cj = zeros(M,1);
er_gm = zeros(M,1);
t_G = zeros(M,1);
t_C = zeros(M,1);
t_sor = zeros(M,1);
t_cj = zeros(M,1);
t_gm = zeros(M,1);


for n = 1:M
    % initialization
    H = hilb(n); % generate Hilbert matrix
    x = ones(n,1);
    b = H * x;
    
    alpha = 0.001;
    A = alpha * eye(n) + H'*H;
    
     % Gauss elimination
    [x_G, t_G(n)] = Gauss(A ,H' * b);
    er_G(n) = norm(x_G - x, 2);
    
    % Cholesky decomposition
    [x_C, t_C(n)] = Chol(A ,H' * b);
    er_C(n) = norm(x_C - x, 2);
    
    % SOR
    [x_sor, t_sor(n)] = SOR(H,b,omega);
    er_sor(n) = norm(x_sor - x, 2);
    
    % Conjugate Gradient Descent
    [x_cj, t_cj(n)] = Conj(H,b);
    er_cj(n) = norm(x_cj - x, 2);
    
    % GMRES
    if n <= 2
        m = n;
    else
        m = n - 2;
    end
    [x_gm, t_gm(n)] = GMRES(H,b,m);
    er_gm(n) = norm(x_gm - x, 2);
end


set(0,'DefaultLineLineWidth',2);

% plotting
figure;

subplot(1,2,1);
plot(1:M,er_G);
hold on;
plot(1:M,er_C);
hold on;
plot(1:M,er_sor);
hold on;
plot(1:M,er_cj);
hold on;
plot(1:M,er_gm);

l = legend('Gauss','Cholesky','SOR','Conjugate','GMRES');
set(l,'FontSize',20);
xlabel('size of the matrix','FontSize',24)
ylabel('error','FontSize',24)

subplot(1,2,2);
plot(1:M,t_G);
hold on;
plot(1:M,t_C);
hold on;
plot(1:M,t_sor);
hold on;
plot(1:M,t_cj);
hold on;
plot(1:M,t_gm);

l = legend('Gauss','Cholesky','SOR','Conjugate','GMRES');
set(l,'FontSize',20);
xlabel('size of the matrix','FontSize',24)
ylabel('time','FontSize',24)
    