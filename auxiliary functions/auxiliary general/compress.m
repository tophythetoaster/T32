function compressed_tensors = compress(dictionary, tensors, varargin)

%tensors is either a single tensor or a cell of tensors

switch nargin
    case 2
       code_opts = Opts;
    case 3
       code_opts = varargin{1};
    otherwise
        error('INVALID INPUT ARGUMENTS!!!');
end


if iscell(tensors)
    num_tensors = length(tensors);
    compressed_tensors = cell(1, num_tensors);
    for j = 1 : num_tensors
        ten = tensors{j};
        coefficients = code(dictionary, ten, code_opts);
        compressed_ten = lincomb(dictionary, coefficients);
        compressed_tensors{j} = compressed_ten;
    end
else
    ten = tensors;
    coefficients = code(dictionary, ten, code_opts);
    compressed_ten = lincomb(dictionary, coefficients);
    compressed_tensors = compressed_ten;
end






