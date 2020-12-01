function [y] = innerP(f,g)
integrand = f .* g;
y = vpa(int(integrand,[-1 1]));
end

