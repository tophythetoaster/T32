
%synthetic data experiment for online nmf
%data cell is cell of vectors


%% make data
m = 400;
r = 10;
num_batches = 200;
batch_size = 1;
n = batch_size * num_batches;

W = rand(m, r);
C = rand(r, n);
X = W * C;

%data_cell is cell of vectors
data_cell = cell(1, num_batches);
for j = 1 : num_batches
    vector = X(:, j);
    data_cell{j} = vector;
end



%% apply online nmf

tic;
W_rec_1 = online_nmf(data_cell, r);
t1 = toc;

tic;
W_rec_2 = online_nmf_faster(data_cell, r);
t2 = toc;


%% validate learned dictionary

c = rand(r, 1);
x = W * c;

c_rec_1 = code(W_rec_1, x);
x_rec_1 = W_rec_1 * c_rec_1;
nom = norm(x_rec_1 - x) / norm(x);
disp(nom);

c_rec_2 = code(W_rec_2, x);
x_rec_2 = W_rec_2 * c_rec_2;
nom = norm(x_rec_2 - x) / norm(x);
disp(nom);

disp(t1);
disp(t2);

