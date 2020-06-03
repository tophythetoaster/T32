function combination = lincomb(dictionary, coefficients)

%dictionary is a cell of R n-tensors. 
%coefficients are R x num_tensors matrix

atom = dictionary{1};
sizes = size(atom);

W = sell2mat(dictionary);
Y = W * coefficients;
combination = mat2sell(Y, sizes);

if length(combination) == 1
    combination = combination{1};
end