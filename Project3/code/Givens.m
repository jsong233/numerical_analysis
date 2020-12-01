function [J] = Givens(j,k,cos1,sin1,n)
J = eye(n);
J(j,j) = cos1;
J(j,k) = sin1;
J(k,j) = -sin1;
J(k,k) = cos1;
end

