function [Y] = Tcheb(X)
alpha = zeros(4,1);
fun1 = @(x)(x.^2 .* log(2+x))./sqrt(1 - x.^2);
alpha(1) = integral(fun1,-1,1)/pi;
Y = alpha(1);
for i = 2:4 
    fun = @(x)(x.^2 .* log(2+x) .* cos((i-1) * acos(x)))./sqrt(1 - x.^2);
    alpha(i) = 2 * integral(fun,-1,1) / pi;
    Y = Y + alpha(i) * cos((i-1)*acos(X));
end
end

