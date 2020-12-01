% add regularization

% initialization
M = 20;
er_G = zeros(M,1);
er_C = zeros(M,1);
t_G = zeros(M,1);
t_C = zeros(M,1);
cond2 = zeros(M,1);


for n = 1:M
    % initialization
    H = hilb(n); % generate Hilbert matrix
    x = ones(n,1);
    b = H * x;
    %s = svd(H);
    alpha = 0.001;
    %alpha = 10 * max(s) * min(s);
    %if alpha >= 1
        %sprintf('Warning: alpha >= 1')
    %end
    
    A = alpha * eye(n) + H'*H;
    
    % condition number
    cond2(n) = cond(A,2);
    
    % Gauss elimination
    [x_G, t_G(n)] = Gauss(A ,H' * b);
    er_G(n) = norm(x_G - x, 2);
    
    % Cholesky decomposition
    [x_C, t_C(n)] = Chol(A ,H' * b);
    er_C(n) = norm(x_C - x, 2);
    

end


set(0,'DefaultLineLineWidth',2);

% plotting
figure;

subplot(1,2,1);
plot(1:M,er_G);
hold on;
plot(1:M,er_C);
l = legend('Gauss','Cholesky');
set(l,'FontSize',20);
xlabel('size of the matrix','FontSize',24)
ylabel('error','FontSize',24)

subplot(1,2,2);
plot(1:M,t_G);
hold on;
plot(1:M,t_C);
l = legend('Gauss','Cholesky');
set(l,'FontSize',20);
xlabel('size of the matrix','FontSize',24)
ylabel('time','FontSize',24)