K = zeros(85*2, 85*2);

% Calculate the system stiffness K_sys

for index=1:2:128
    
    % Get the diagonal for node_i in the element
    n1 = nodes(elements(index).node_i);
    K_sum = getDiagonalKSum(n1, elements);
    i = n1.index*2 - 1;
    K(i:i+1,i:i+1) = K_sum;
    
    % If the element touches the top we need to
    % do an extra computation
    if mod(elements(index).node_m,5) == 0
        n1 = nodes(elements(index).node_m);
        K_sum = getDiagonalKSum(n1, elements);
        i = n1.index*2 - 1;
        K(i:i+1,i:i+1) = K_sum;
    end
    
    % Special case of the last column where we need to
    % count node_j for each element
    if index > 120
        n1 = nodes(elements(index).node_j);
        K_sum = getDiagonalKSum(n1, elements);
        i = n1.index*2 - 1;
        K(i:i+1,i:i+1) = K_sum;
    end
    
    % Very special case of the last odd element 127
    % We need to include the very last node 85
    if index == 127
        n1 = nodes(elements(index+1).node_m);
        K_sum = getDiagonalKSum(n1, elements);
        i = n1.index*2 - 1;
        K(i:i+1,i:i+1) = K_sum;        
    end
    
    % Horizontal lines
    % nodes i-j
    n1 = nodes(elements(index).node_i);
    n2 = nodes(elements(index).node_j);
    [e1,e2] = getTouchingElements(n1,n2);
    K_sum = getNonDiagonalKSum(n1,n2,e1,e2,elements);
    i = n1.index*2 - 1;
    j = n2.index*2 - 1;
    K(i:i+1, j:j+1) = K_sum;
    % Symmetric matrix
    K(j:j+1, i:i+1) = K_sum;
    
    % Special case of top nodes
    if mod(elements(index).node_m,5) == 0
        n1 = nodes(elements(index).node_m);
        n2 = nodes(elements(index+1).node_m);
        % There is only one element that touches this line
        e1 = index+1;
        e2 = -1;
        K_sum = getNonDiagonalKSum(n1,n2,e1,e2,elements);
        i = n1.index*2 - 1;
        j = n2.index*2 - 1;
        K(i:i+1, j:j+1) = K_sum;
        K(j:j+1, i:i+1) = K_sum;
    end
    
    % Vertical lines
    n1 = nodes(elements(index).node_i);
    n2 = nodes(elements(index).node_m);
    [e1, e2] = getTouchingElements(n1,n2);
    K_sum = getNonDiagonalKSum(n1,n2,e1,e2,elements);
    i = n1.index*2 - 1;
    j = n2.index*2 - 1;
    K(i:i+1, j:j+1) = K_sum;
    % Symmetric matrix
    K(j:j+1, i:i+1) = K_sum;
    
    % Special case of last column
    if index > 120
        n1 = nodes(elements(index+1).node_j);
        n2 = nodes(elements(index+1).node_m);
        [e1, e2] = getTouchingElements(n1,n2);
        K_sum = getNonDiagonalKSum(n1,n2,e1,e2,elements);
        i = n1.index*2 - 1;
        j = n2.index*2 - 1;
        K(i:i+1, j:j+1) = K_sum;
        % Symmetric matrix
        K(j:j+1, i:i+1) = K_sum;
    end
    
    % Diagonal lines
    % No special cases.
    n1 = nodes(elements(index).node_j);
    n2 = nodes(elements(index).node_m);
    e1 = index;
    e2 = index+1;
    K_sum = getNonDiagonalKSum(n1,n2,e1,e2,elements);
    i = n1.index*2 - 1;
    j = n2.index*2 - 1;
    K(i:i+1, j:j+1) = K_sum;
    % Symmetric matrix
    K(j:j+1, i:i+1) = K_sum;
end

clear index i j e e1 e2 n1 n2 K_sum n1 length


