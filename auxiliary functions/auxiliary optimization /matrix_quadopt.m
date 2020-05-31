function X = matrix_quadopt(A, B, varargin)

switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


[M, R] = size(B);
b = zeros(M * R, 1);
blocks = {};
for r = 1 : R
    blocks{end + 1} = A;
    b(M * (r - 1) + 1 : M * r, 1) = B(:, r);
end
A_blocks = blkdiag(blocks{:});

if ~isempty(opts.initialization)
    X0 = opts.initialization;
    opts.initialization = X0(:);            %check to be sure this is right
end

x = quadopt(A_blocks, b, opts);
X = reshape(x, [M, R]);

