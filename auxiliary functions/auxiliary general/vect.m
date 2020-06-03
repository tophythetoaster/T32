function mat = vect(tensors)
%tensors is either a single tensor or a cell containing tensors 
%returns matrix whose columns are the vectorized tensors

if iscell(tensors)
    mat = sell2mat(tensors);
else
    mat = tensors(:);  
end