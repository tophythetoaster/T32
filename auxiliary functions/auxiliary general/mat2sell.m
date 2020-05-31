function tensor_cell = mat2sell(mat, sizes)
%columns of matrix are reshaped according to sizes

R = length(mat(1, :));
tensor_cell = cell(1, R);
for r = 1 : R
    vect = mat(:, r);
    vect = reshape(vect, sizes);
    tensor_cell{r} = vect;
end