function mat = sell2mat(tensor_cell)

R = length(tensor_cell);
ten1 = tensor_cell{1};
M = prod(size(ten1));
mat = zeros(M, R);
for r = 1 : R
    ten = tensor_cell{r};
    ten = ten(:);
    mat(:, r) = ten;
end