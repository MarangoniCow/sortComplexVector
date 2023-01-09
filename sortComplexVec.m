
function [vecSorted, idxList] = sortComplexVec(vec)
% SORTCOMPLEXVEC(VEC)   Sort a vector by it's largest imaginary value
% first, then it's largest real value second.

    
    % Insist on numeric
    arguments
        vec     {mustBeNumeric}
    end
    
    % Check for vector
    [r, c] = size(vec);
    if (r ~= 1) && (c ~= 1)
        error('Input must be a 1-by-n or n-by-1 vector')
    end
    
    % Fetch vector length
    n = length(vec);
    if n < 2
        vecSorted = vec;
        return
    end
    idxList = 1:n;

    % Sort by imaginary component
    [~, idx_imag] = sort(imag(vec), 'descend');
    vecSorted = vec(idx_imag);
    idxList = idxList(idx_imag);
    

    % Find consecutive duplicate imaginary numbers
    idx_cell = consecutiveduplicates(imag(vecSorted));

    for k = 1:length(idx_cell)
        sortSubstring(idx_cell{k});
    end

    
    


    function sortSubstring(list)
        subvector   = vecSorted(list);
        sublist     = idxList(list);

        [~, idx_real] = sort(real(subvector), 'descend');

        vecSorted(list)     = subvector(idx_real);
        idxList(list)       = sublist(idx_real);
    end

    function C = consecutiveduplicates(vector)
    
        j = 1;
        count = 1;
        C{1} = [];
    
        for i = 2:length(vector)
            if vector(i - 1) == vector(i)
                if count == 1
                    C{j} = [i - 1, i];
                else
                    C{j} = [C{j}, i];
                end
                count = count + 1;
            else
                if count > 1
                    j = j + 1;
                end
                count = 1;
            end
        end
    end
end
