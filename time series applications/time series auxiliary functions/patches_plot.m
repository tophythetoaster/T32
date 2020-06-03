function tiled = patches_plot(patches, h, num_rows, num_cols)

tiled = tiledlayout(num_rows, num_cols);
p1 = patches{1};
T0 = length(p1(1, :));
t = h * (1 : T0);

num_patches = length(patches);
for p = 1 : num_patches
    
    nexttile;
    patch = patches{p};
    plot(t, patch);
    
end