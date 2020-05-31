function x = quadopt(A, b, varargin)

switch nargin
    case 2
        opts = Opts;
    case 3
        opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end



switch opts.key
    case 'mu'
        x = mu_quadprog(A, b, opts);
    otherwise
        error('INVALID KEY!!!');
end

end



function x = mu_quadprog(A, b, opts)
    n = length(b);
    num_its = opts.num_its;
    lambda = opts.lambda;
    if isempty(opts.initialization)
        initialization = rand(n, 1);
    else
        initialization = opts.initialization;
    end
    
    x = initialization;
    for it = 1 : num_its
        x = x .* b ./ (A * x + lambda * ones(n, 1));
    end

end





