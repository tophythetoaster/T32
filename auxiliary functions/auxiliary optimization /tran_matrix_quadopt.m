function X = tran_matrix_quadopt(A, B, varargin)

switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


if ~isempty(opts.initialization)
    X0 = opts.initialization;
    X0 = X0';
    opts.initialization = X0(:);            %check to be sure this is right
end

Y = quadopt(A, B', opts);
X = Y;

