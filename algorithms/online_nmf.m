function W = online_nmf(vector_cell, r, varargin)

switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


T = length(vector_cell);
vect1 = vector_cell{1};
m = length(vect1);

W = rand(m, r);
A = zeros(r);
B = zeros(m, r);
for t = 1 : T
    x = vector_cell(t);
    c = code(W, )
    
end