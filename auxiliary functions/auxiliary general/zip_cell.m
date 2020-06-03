function zipped_cell = zip_cell(cell_of_cells)

batch_length = length(cell_of_cells);
cell1 = cell_of_cells{1};
T = length(cell1);

zipped_cell = cell(1, T);

for t = 1 : T
    
    batch = cell(1, batch_length);              %iterating through cell of cells to zip together everthing at time t
    for b = 1 : batch_length
        
        sell = cell_of_cells{b};
        batch{b} = sell{t};
        
    end
    
    zipped_cell{t} = batch;
    
end