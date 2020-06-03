%% online ntf iid patches, reshape fully



%% get iid data patches
image = imread('monet.jpg');
%figure, imshow(image);
image = im2double(image);

length = 10;
width = length;
num_patches = 1000;
image_patches = get_iid_image_patches(image, length, width, num_patches);

batch_size = 25;
image_patches = cell2batches(image_patches, batch_size);



%% train dictionary

reshaped_image_patches = reshape_tensor_cell_2(image_patches, [3 * length * width, 1]);

R = 25;
opts = Opts;
opts.lambda = 0;
dictionary_patches = online_NTF(reshaped_image_patches, R, opts);

dictionary_patches = reshape_tensor_cell(dictionary_patches, [length, width, 3]);


%% display dictionary

dictionary_image_patches = cell2uint8(dictionary_patches);
figure, montage(dictionary_image_patches);


%{
%% compress new patches

num_new_patches = R;
new_patches = get_iid_image_patches(image, length, width, num_new_patches);
new_patches = reshape_tensor_cell(new_patches, [length * width, 3]);
compressed_patches = compress(dictionary_patches, new_patches, opts);


%% display new patches and their compressed form

new_image_patches = cell2uint8(new_patches);
figure, montage(new_image_patches);

compressed_image_patches = cell2uint8(compressed_patches);
figure, montage(compressed_patches);


%}
