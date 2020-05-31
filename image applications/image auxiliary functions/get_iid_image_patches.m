function image_patches = get_iid_image_patches(image, patch_length, patch_width, num_patches)

image_patches = cell(1, num_patches);

sizes = size(image);
M = sizes(1);
N = sizes(2);
c = length(sizes);
switch c
    case 2
        for p = 1 : num_patches
            i = randi([1, M - patch_length + 1]);
            j = randi([1, N - patch_width + 1]);
            patch = image(i : i + patch_length - 1, j : j + patch_width - 1);
            image_patches{p} = patch;
        end
    case 3
        for p = 1 : num_patches
            i = randi([1, M - patch_length + 1]);
            j = randi([1, N - patch_width + 1]);
            patch = image(i : i + patch_length - 1, j : j + patch_width - 1, :);
            image_patches{p} = patch;
        end
    otherwise
        error('INVALID IMAGE DATA!!!');
end
  
        
    
    
    