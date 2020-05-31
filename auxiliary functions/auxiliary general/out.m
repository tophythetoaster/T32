function dictionary_cell = out(factor_cell)

num_factors = length(factor_cell);
fact1 = factor_cell{1};
R = length(fact1(1, :));
dictionary_cell = cell(1, R);

for r = 1 : R
    vector_cell = cell(1, num_factors);
    for f = 1 : num_factors
        factor = factor_cell{f};
        vector = factor(:, r);
        vector_cell{f} = vector;
    end
    atom = ktensor(vector_cell);
    atom = tensor(atom);
    atom = double(atom);
    dictionary_cell{r} = atom;
end

