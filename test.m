


% 
% b = [1, 2, 3, 4, 4, 4, 5, 5, 6];
% 
% consecutiveduplicates(b)

b{1} = [1, 2, 3, 4];
b{2} = [3, 4, 2, 5];
b{3} = [1i, 2i, 3i];
b{4} = [3i, 2i, 1i];
b{5} = [1, 2, 1i, 2i];
b{6} = [1 + 1i, 1 + 2i, 1 + 3i];
b{7} = [1 + 1i, 2 + 1i, 3 + 1i];
b{8} = [1 + 1i, 2 + 2i, 3 + 3i];
b{9} = [1 + 1i, -1 + 1i, 2 + 2i, -2 + 2i];


for i = 1:length(b)
    
    disp(['Unsorted vector: ', num2str(b{i})])
    [~, idxlist] = sortComplexVec(b{i});
    disp(['Sorted vector: ', num2str(b{i}(idxlist))]);
    disp(' ')


end