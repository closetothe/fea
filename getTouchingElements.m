function [e1, e2] = getTouchingElements(n1, n2)
    % This function finds the two elements that
    % are both touching node1 and node2 in O(NlogN) time
    % (Node.elements is pre-sorted so 
    % ismember can perform a binary search)
    intersection = ismember(n1.elements, n2.elements);
    s = size(intersection,2);
    e1 = -1;
    e2 = -1;
    for i=1:s
        if intersection(i) == 1 && e1 == -1
            e1 = i;
        elseif intersection(i) == 1
            e2 = i;
            break
        end
    end
    e1 = n1.elements(e1);
    if e2 > 0
        e2 = n1.elements(e2);
    end
end