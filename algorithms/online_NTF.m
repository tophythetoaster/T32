function [dictionary_cell, varargout] = online_NTF(data_cell, R, varargin)
%data cell is either cell of tensors or cell of cells of tensors (tensor
%batches)

switch nargin
    case 2
        code_opts = Opts;
    case 3
        code_opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


X1 = data_cell{1};
if iscell(X1)
    X1 = X1{1};
    sizes = size(X1);
    n = length(sizes);
    M = prod(sizes);
else
    sizes = size(X1);
    n = length(sizes);
    M = prod(sizes);
end


A = zeros(R);
B = zeros(M, R);

factor_cell = initialize_factor_cell(sizes, R);
dictionary = out(factor_cell);

dictionary_opts = Opts;
T = length(data_cell);
for t = 1 : T
    
    disp(t);
    
    
    %code new data (batch)
    X = data_cell{t};                    %either a single tensor or a cell of tensors
    C = code(dictionary, X);
    
    %aggregate
    X = vect(X);
    A = (t - 1) * A + C * C';   
    A = A / t;
    B = (t - 1) * B + X * C';
    B = B / t;
    
    %update dictionary, one factor at a time
    for j = 1 : n
        U = factor_cell{j};
        A_U = get_A_U(A, factor_cell, j);
        B_U = get_B_U(B, factor_cell, j, sizes);
        dictionary_opts.initialization = U;
        U = tran_matrix_quadopt(A_U, B_U, dictionary_opts);
        factor_cell{j} = U;
    end
    
    dictionary_cell = out(factor_cell);

    
end

end



function A_U = get_A_U(A, factor_cell, j)
    A_U = A;
    n = length(factor_cell);
    for k = 1 : n
        if k ~= j
            U = factor_cell{k};
            A_U = A_U .* (U' * U);
        end
    end
end


function B_U = get_B_U(B, factors, j, sizes)
     
    factj = factors{j};
    [I, R] = size(factj);
    Bees = mat2sell(B, sizes);      %stores tensors obtained from columns of B 
    
    n = length(factors);
    idx = [];
    for k = 1 : n
        if k ~= j
            idx = [idx, k];
        end
    end
        
    
    B_U = zeros(I, R);
    for r = 1 : R
        us = {};
        for k = 1 : n
            if k ~= j
                fact = factors{k};
                u = fact(:, r);
                us{end + 1} = u;
            end
        end
        
        bee = Bees{r};
        bee = tensor(bee);
        B_U(:, r) = ttm(bee, us, idx, 't');
        
    end
    
end











