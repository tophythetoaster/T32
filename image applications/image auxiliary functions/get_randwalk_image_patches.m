function image_patches = get_randwalk_image_patches(image, patch_length, patch_width, num_patches)

image_patches = cell(1, num_patches);

sizes = size(image);
M = sizes(1);
N = sizes(2);
c = length(sizes);

a = M - patch_length + 1;
b = N - patch_width + 1;

switch c
    case 2
        i = randi(a);
        j = randi(b);
        for p = 1 : num_patches
            comp = randi(4);
            switch comp
                case 1
                    j = j + 1;
                case 2
                    i = i + 1;
                case 3
                    j = j - 1;
                case 4
                    i = i - 1;
            end
            
            if i == 0
                i = i + 1;
            elseif i == a
                i = i - 1;
            elseif j == 0
                j = j + 1;
            elseif j == b
                j = j - 1;
            end
            
            patch = image(i : i + patch_length - 1, j : j + patch_width - 1);
            image_patches{p} = patch;
        end

    
    case 3
        
        i = randi(a);
        j = randi(b);
        for p = 1 : num_patches
            comp = randi(4);
            switch comp
                case 1
                    j = j + 1;
                case 2
                    i = i + 1;
                case 3
                    j = j - 1;
                case 4
                    i = i - 1;
            end
            
            if i == 0
                i = i + 1;
            elseif i == a
                i = i - 1;
            elseif j == 0
                j = j + 1;
            elseif j == b
                j = j - 1;
            end
            
            patch = image(i : i + patch_length - 1, j : j + patch_width - 1, :);
            image_patches{p} = patch;
        end

    otherwise
        error('INVALID IMAGE DATA!!!');

end


  




        
    