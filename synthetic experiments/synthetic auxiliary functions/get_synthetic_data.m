function data_cell = get_synthetic_data(dictionary, T, varargin)

data_cell = cell(1, T);
R = length(dictionary);
switch nargin 
    case 2
        for t = 1 : T
            c = rand(R, 1);
            ten = lincomb(dictionary, c);
            data_cell{t} = ten;
        end
    case 3
        batch_size = varargin{1};
        for t = 1 : T
            C = rand(R, batch_size);
            batch = lincomb(dictionary, C);
            data_cell{t} = batch;
        end
    otherwise 
        error('INVALID INPUTE DATA!!!');
end
