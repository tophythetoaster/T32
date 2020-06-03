
%demo of online ntf on synthetic data

%% make data

sizes = [30, 40, 20];
R = 5;
D = initialize_dictionary(sizes, R);
T = 200;
data = get_synthetic_data(D, T);

%% learn dictionary

D_rec = online_NTF(data, R);


%% validate dictionary

c = rand(R, 1);
X = lincomb(D, c);

c_rec = code(D_rec, X);
X_rec = lincomb(D_rec, c_rec);

X = X(:);
X_rec = X_rec(:);
nom = norm(X - X_rec) / norm(X);
disp(nom);











