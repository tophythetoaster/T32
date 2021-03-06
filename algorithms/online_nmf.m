function W = online_nmf(data_cell, r, varargin)
%data cell is either a cell of vectors or a cell of cells of vectors
%(batches)

switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


T = length(data_cell);
batch = data_cell{1};
if iscell(batch)
    vector = batch{1};
    m = length(vector(:, 1));
else
    vector = batch;
    m = length(vector(:, 1));
end



W = rand(m, r);
A = zeros(r);
B = zeros(m, r);
for t = 1 : T
    
    str = sprintf("Online nmf data batch %d of %d", t, T);
    disp(str);
    
    %new data sample or batch arrives
    batch = data_cell{t};
    if iscell(batch)
        X = sell2mat(batch);
    else
        X = batch;      %in this case batch should be a matrix or vector
    end
    
    %obtain optimal code using previous dictionary
    C = code(W, X);
        
    %aggregate
    A = (t - 1) * A + C * C';
    A = A / t;
    B = (t - 1) * B + X * C';
    B = B / t;
    
    %update dictionary
    opts.initialization = W;
    W = tran_matrix_quadopt(A, B, opts);
    
    
end








