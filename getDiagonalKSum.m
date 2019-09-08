function K_sum = getDiagonalKSum(node,elements)
        length = size(node.elements,2);
        K_sum = [ 0 0 ; 0 0 ];
        for z=1:length
            e = node.elements(z);
            i = (elements(e).index_map(node.index))*2-1;
            K_sum = K_sum + elements(e).K(i:i+1, i:i+1);
        end
end