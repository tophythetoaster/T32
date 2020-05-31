
%WHAT THIS TOTALLY FAILS!!!!!!

%ADD OTHER FUNCTIONS LATER TO CONDENSE THIS A TAD BIT 
%ncp with proper conversion

%% get image patch data

image = imread('monet.jpg');
%figure, imshow(image);
image = im2double(image);

patch_length = 10;
patch_width = patch_length;
num_patches = 200;
image_patches = get_iid_image_patches(image, patch_length, patch_width, num_patches);


%% apply ncp

X = zeros(patch_length, patch_width, 3, num_patches);
for j = 1 : num_patches
    patch = image_patches{j};
    X(:, :, :, j) = patch;
end
X = tensor(X);
R = 5; 
[X_approx_ks,iter,REC] = ncp(X,R);

A = X_approx_ks{1};
B = X_approx_ks{2};
C = X_approx_ks{3};
factor_cell = {A, B, C};
dictionary_cell = out(factor_cell);



%% reformat, plot
 
dictionary_cell = cell2uint8(dictionary_cell);
montage(dictionary_cell);


