% n = 10
n = 10;
X = zeros(1,n+1);
Y = zeros(1,n+1);
for j = 1:(n+1)
    X(j) = -1 + (2*(j-1))/n;
end
Y = (1 + 25 * X.^2).^(-1);

L = Lagrange(X,Y);
p = sym2poly(L);
m_1 = 50/26^2; m_n = -m_1;

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
subplot(1,4,1)
x = -1:0.01:1;
y = (1 + 25 * x.^2).^(-1);
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
legend('f(x)');
xlim([-1,1]);
ylim([0,1]);
grid on;
title('f(x)');

subplot(1,4,2)
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,polyval(p,x),lineSpec{1},'markersize',4,'Color',color{1})
ylim([0,1])
hold on;
plot(X,polyval(p,X),lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','L(x)','L(X)')
title('Lagrange Interpolation')


subplot(1,4,3)
for i = 1:length(x)
    z1(i) = pieceLin(X,Y,x(i));
end
for i = 1:length(X)
    z2(i) = pieceLin(X,Y,X(i));
end
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,z1,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(X,z2,lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','I(x)','I(X)')
title('Piecewise Linear Interpolation')


subplot(1,4,4)
for i = 1:length(x)
    t1(i) = spline3(X,Y,m_1,m_n,x(i));
end
for i = 1:length(X)
    t2(i) = spline3(X,Y,m_1,m_n,X(i));
end
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,t1,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(X,t2,lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','S(x)','S(X)')
title('Cubic Spline Interpolation')

% n = 20
n = 20;
X = zeros(1,n+1);
Y = zeros(1,n+1);
for j = 1:(n+1)
    X(j) = -1 + (2*(j-1))/n;
end
Y = (1 + 25 * X.^2).^(-1);

L = Lagrange(X,Y);
p = sym2poly(L);
m_1 = 50/26^2; m_n = -m_1;

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
subplot(1,4,1)
x = -1:0.01:1;
y = (1 + 25 * x.^2).^(-1);
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
legend('f(x)');
xlim([-1,1]);
ylim([0,1]);
grid on;
title('f(x)');

subplot(1,4,2)
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,polyval(p,x),lineSpec{1},'markersize',4,'Color',color{1})
ylim([0,1])
hold on;
plot(X,polyval(p,X),lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','L(x)','L(X)')
title('Lagrange Interpolation')


subplot(1,4,3)
for i = 1:length(x)
    z1(i) = pieceLin(X,Y,x(i));
end
for i = 1:length(X)
    z2(i) = pieceLin(X,Y,X(i));
end
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,z1,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(X,z2,lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','I(x)','I(X)')
title('Piecewise Linear Interpolation')


subplot(1,4,4)
for i = 1:length(x)
    t1(i) = spline3(X,Y,m_1,m_n,x(i));
end
for i = 1:length(X)
    t2(i) = spline3(X,Y,m_1,m_n,X(i));
end
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,t1,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(X,t2,lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','S(x)','S(X)')
title('Cubic Spline Interpolation')


% n = 30
n = 30;
X = zeros(1,n+1);
Y = zeros(1,n+1);
for j = 1:(n+1)
    X(j) = -1 + (2*(j-1))/n;
end
Y = (1 + 25 * X.^2).^(-1);

L = Lagrange(X,Y);
p = sym2poly(L);
m_1 = 50/26^2; m_n = -m_1;

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
subplot(1,4,1)
x = -1:0.01:1;
y = (1 + 25 * x.^2).^(-1);
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
legend('f(x)');
xlim([-1,1]);
ylim([0,1]);
grid on;
title('f(x)');

subplot(1,4,2)
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,polyval(p,x),lineSpec{1},'markersize',4,'Color',color{1})
ylim([0,1])
hold on;
plot(X,polyval(p,X),lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','L(x)','L(X)')
title('Lagrange Interpolation')


subplot(1,4,3)
for i = 1:length(x)
    z1(i) = pieceLin(X,Y,x(i));
end
for i = 1:length(X)
    z2(i) = pieceLin(X,Y,X(i));
end
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,z1,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(X,z2,lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','I(x)','I(X)')
title('Piecewise Linear Interpolation')


subplot(1,4,4)
for i = 1:length(x)
    t1(i) = spline3(X,Y,m_1,m_n,x(i));
end
for i = 1:length(X)
    t2(i) = spline3(X,Y,m_1,m_n,X(i));
end
plot(x,y,lineSpec{3},'markersize',4,'Color',color{3})
hold on;
plot(x,t1,lineSpec{1},'markersize',4,'Color',color{1})
hold on;
plot(X,t2,lineSpec{2},'markersize',5,'Color',color{2})
grid on;
legend('f(x)','S(x)','S(X)')
title('Cubic Spline Interpolation')