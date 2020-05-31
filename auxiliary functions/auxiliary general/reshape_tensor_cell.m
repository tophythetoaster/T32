function reshaped_tensor_cell = reshape_tensor_cell(tensor_cell, new_sizes)

num_tensors = length(tensor_cell);
reshaped_tensor_cell = cell(1, num_tensors);
for t = 1 : num_tensors
    ten = tensor_cell{t};
    ten = reshape(ten, new_sizes);
    reshaped_tensor_cell{t} = ten;
end

