f = @(x) x^2 * log(2+x);
x = -1:0.05:1;
y = x.^2 .* log(2+x);
y_T = zeros(length(x),1);

[S,P] = GS(f,3);

for i = 1:length(x)
    y_T(i) = Tcheb(x(i));
end

n = 4;
interX = zeros(1,n); interY = zeros(1,n);
for i = 1:n
    interX(i) = cos((2*i - 1)*pi/(2*n));
    interY(i) = f(interX(i));
end
L = Lagrange(interX,interY);



set(0,'DefaultLineLineWidth',2);

blue = [0.0000    0.4470    0.7410];
red = [0.8500    0.3250    0.0980];
gold = [0.9290    0.6940    0.1250];
teal = [32 178 170]/255;
green= [134, 179, 0]/255;
purple = [153 102 255]/255;

color = {blue red gold green teal purple};
lineSpec = {'-o','-^','-s','-*','-+','-d'};

figure;
subplot(1,3,1)
p = sym2poly(S);
plot(x,y,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(x,polyval(p,x),lineSpec{2},'markersize',4,'Color',color{2})
l = legend('$f(x)$','$S_3^*(x)$');
set(l,'Interpreter','latex'); set(l,'FontSize',20);
xlabel('Gram-Schmit','FontSize',20);
grid on;

subplot(1,3,2)
plot(x,y,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(x,y_T,lineSpec{2},'markersize',4,'Color',color{2})
l = legend('$f(x)$','$S_3^*(x)$');
set(l,'Interpreter','latex'); set(l,'FontSize',20);
xlabel('Truncated Tchebychev','FontSize',20);
grid on;

subplot(1,3,3)
P_L = sym2poly(L);
plot(x,y,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(x,polyval(P_L,x),lineSpec{2},'markersize',4,'Color',color{2})
l = legend('$f(x)$','$L_3(x)$');
set(l,'Interpreter','latex'); set(l,'FontSize',20);
xlabel('Lagrange Minimization','FontSize',20);
grid on;