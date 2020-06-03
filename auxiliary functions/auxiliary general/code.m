function C = code(dictionary, batch, varargin)

%CHECK ALL CASES TO BE SURE THIS IS WORKING!!!!!

%dictionary is either a matrix of cell of tensors
%batch is either a tensor or a cell of tensors. In the case that it's a
%matrix, it will see based on dictionary if it is meant to be a single
%2-tensor or a batch of vectors

switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


if iscell(dictionary)
    W = sell2mat(dictionary);
    if iscell(batch)
        X = sell2mat(batch);
        A = W' * W;
        B = W' * X;
        C = matrix_quadopt(A, B, opts);
    else
        %in this case, dictionary is a cell, batch is a single tensor
        x = batch(:);
        A = W' * W;
        B = W' * x;
        C = matrix_quadopt(A, B, opts);
    end
    
else
    W = dictionary; 
    if iscell(batch)
        X = sell2mat(batch);        %in this case batch should be cell of vectors, so this just makes matrix where those are cols
    else
        X = batch;
    end
    A = W' * W;
    B = W' * X;
    C = matrix_quadopt(A, B, opts);
end


