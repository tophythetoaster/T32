%%get image data

image = imread('monet.jpg');
image = im2double(image);

patch_length = 10;
patch_width = patch_length;
num_patches = 200;
image_patches = get_iid_image_patches(image, patch_length, patch_width, num_patches);


%% apply online nmf

image_patches = reshape_tensor_cell(image_patches, [patch_length * patch_width * 3, 1]);
r = 25;
W = online_nmf(image_patches, r);


%% display dictionary

W = mat2sell(W, [patch_length, patch_width, 3]);
W = cell2uint8(W);
montage(W);



