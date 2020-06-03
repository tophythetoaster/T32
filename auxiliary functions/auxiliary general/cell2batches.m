function batches = cell2batches(tensors, batch_size)
    num_tensors = length(tensors);
    num_batches = floor(num_tensors / batch_size);
    batches = cell(1, num_batches);
    for j = 1 : num_batches
        batch = cell(1, batch_size);
        for k = 1 : batch_size
            idx = batch_size * (j - 1) + k;
            ten = tensors{idx};
            batch{k} = ten;
        end
        batches{j} = batch;
    end
end