function c = code(dictionary_cell, ten, varargin)


%also allow for justa matrix


switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end

dictionary_mat = sell2mat(dictionary_cell);
x = ten(:);

A = dictionary_mat' * dictionary_mat;
b = dictionary_mat' * x;

c = quadopt(A, b, opts);