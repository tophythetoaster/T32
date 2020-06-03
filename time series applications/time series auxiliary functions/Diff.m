function X  = Diff(x, h, m)

T = length(x);
M = m + 1;
N = T - m;

X = zeros(M, N);
X(1, :) = x(1 : N);
y = x;
for i = 1 : m
    y = diff(y) / h;
    X(i + 1, :) = y(1 : N);
end

