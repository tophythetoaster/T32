function ave = avel2l12(C)

n = length(C(1, :));
ave = 0;
for j = 1 : n
    c = C(:, j);
    s = sum(abs(c));
    ave = ave + s;
end

ave = ave / n;
