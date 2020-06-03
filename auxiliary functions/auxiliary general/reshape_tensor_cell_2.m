function cell_of_cells_of_reshaped_tensors = reshape_tensor_cell_2(cell_of_tensor_cells, new_sizes)

num_tensor_cells = length(cell_of_tensor_cells);
cell_of_cells_of_reshaped_tensors = cell(1, num_tensor_cells);

for s = 1 : num_tensor_cells
    sell = cell_of_tensor_cells{s};
    reshaped_cell = reshape_tensor_cell(sell, new_sizes);
    cell_of_cells_of_reshaped_tensors{s} = reshaped_cell;
end

