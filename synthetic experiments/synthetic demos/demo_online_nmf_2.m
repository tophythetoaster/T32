
%synthetic data experiment for online nmf
%data cell is cell of matrices (batches of vectors)


%% make data
m = 100;
r = 10;
num_batches = 200;
batch_size = 10;
n = batch_size * num_batches;

W = rand(m, r);
C = rand(r, n);
X = W * C;


%data_cell is cell of matrices (batches of vectors)
data_cell = cell(1, num_batches);
for j = 1 : num_batches
    matrix = X(:, batch_size * (j - 1) + 1 : batch_size * j);
    data_cell{j} = matrix;
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