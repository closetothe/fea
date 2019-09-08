function K_sum = getNonDiagonalKSum(n1, n2, e1, e2, elements)
    % This function calculates the K submatrix for two nodes
    % (i.e. lines)
    % This involves summing K submatrices of 2 elements if two elements
    % are touching both nodes (otherwise we return the K submatrix of the
    % only element that touches the node)
    
    i1 = (elements(e1).index_map(n1.index))*2-1;
    j1 = (elements(e1).index_map(n2.index))*2-1;
    K_sum = elements(e1).K(i1:i1+1, j1:j1+1);
    if e2 > 0
        i2 = (elements(e2).index_map(n1.index))*2-1;
        j2 = (elements(e2).index_map(n2.index))*2-1;
        K_sum = K_sum + elements(e2).K(i2:i2+1, j2:j2+1);
    end
end