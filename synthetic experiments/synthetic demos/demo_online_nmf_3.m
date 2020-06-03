
%synthetic data experiment for online nmf
%data cell is cell of cells of vectors (so we represent batch as a cell of
%vectors, as opposed to a single matrix, as in demo_online_nmf_2


%% make data
m = 100;
r = 10;
num_batches = 200;
batch_size = 5;
n = batch_size * num_batches;

W = rand(m, r);
C = rand(r, n);
X = W * C;


%data_cell is cell of cells of vectors (also batches)
data_cell = cell(1, num_batches);
for j = 1 : num_batches
    matrix = X(:, batch_size * (j - 1) + 1 : batch_size * j);
    vector_cell = mat2sell(matrix, [m, 1]);
    data_cell{j} = vector_cell;
end



%% apply online nmf

W_rec = online_nmf(data_cell, r);


%% validate learned dictionary

c = rand(r, 1);
x = W * c;

c_rec = code(W_rec, x);
x_rec = W_rec * c_rec;
nom = norm(x_rec - x) / norm(x);
disp(nom);

