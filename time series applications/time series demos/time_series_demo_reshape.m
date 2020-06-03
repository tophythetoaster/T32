
%time series data built from taking sin and derivatives, data patches
%extracted sequentially

%% get joint time series patch data

prec = 10;
h = 1 / prec;
T = 100 / h;
t = h * (1 : T);

x = sin(t);
m = 3;
X = Diff(x, h, m);
X = X + 1;
%figure, plot(1 : T - m, X);

T0 = 30;
shift = 5;
shifted_patches = get_shifted_patches(X, T0, shift);


%% apply online-NTF

row = 5;
col = 3;
R = row * col;

opts = Opts;
opts.lambda = .2;

p1 = shifted_patches{1};
l = length(p1(:, 1));
w = length(p1(1, :));
shifted_patches = reshape_tensor_cell(shifted_patches, [l * w, 1]);
dictionary_patches = online_NTF(shifted_patches, R, opts);
dictionary_patches = reshape_tensor_cell(dictionary_patches, [l, w]);



%% display learned dictionary


pt = patches_plot(dictionary_patches, h, row, col);


