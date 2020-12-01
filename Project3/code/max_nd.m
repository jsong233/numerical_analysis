function [value,r,c] = max_nd(A)
% find the nondiagonal entry with the largest absolute value
D = diag(diag(A));
UP = triu(A) - D;
LOW = tril(A) - D;
UPmax = max(max(abs(UP)));
LOWmax = max(max(abs(LOW)));
if UPmax >= LOWmax
    value = UPmax;
    [r,c] = find(UPmax == abs(UP));
else
    value = LOWmax;
    [r,c] = find(LOWmax == abs(LOW));
end
if size([r,c],1) > 1
    r = r(1); c = c(1);
end
end

