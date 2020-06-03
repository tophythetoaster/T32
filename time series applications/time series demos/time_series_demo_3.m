
%time series data built from taking sin and derivatives, data patches
%extracted sequentially

%uses sparsity regularization

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

mult = 10;
R = mult * m;
dictionary_patches = online_NTF(shifted_patches, R);


%% display learned dictionary
r = mult;
c = m;
pt = patches_plot(dictionary_patches, h, r, c);


%% understand sparsity

codes = code(dictionary_patches, shifted_patches);
ave = avel2l12(codes);
disp(ave);


