function uint8_cell = cell2uint8(image_cell)

num_images = length(image_cell);
uint8_cell = cell(1, num_images);
for c = 1 : num_images
    patch = image_cell{c};
    patch = im2uint8(patch);
    uint8_cell{c} = patch;
end