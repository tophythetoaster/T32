function shifted_patches = get_shifted_patches(X, T0, shift)

T = length(X(1, :));
num_patches = floor((T - T0) / shift) + 1;
shifted_patches = cell(1, num_patches);

for p = 1 : num_patches
    a = 1 + shift * (p - 1);
    b = T0 + shift * (p - 1);
    patch = X(:, a : b);
    shifted_patches{p} = patch;
end