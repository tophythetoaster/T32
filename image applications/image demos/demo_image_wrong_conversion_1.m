
%mistake: correct conversion in beginning, but no conversion at end


%% get image patch data

image = imread('monet.jpg');
figure, imshow(image);
image = im2double(image);

patch_length = 20;
patch_width = patch_length;
num_patches = 200;
image_patches = get_iid_image_patches(image, patch_length, patch_width, num_patches);


%% vectorize and apply offline nmf

X = sell2mat(image_patches);
R = 25;
[W, H] = nnmf(X, R);
sizes = [patch_length, patch_width, 3];
dictionary_patches = mat2sell(W, sizes);


%% display images

montage(dictionary_patches);