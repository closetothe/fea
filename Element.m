classdef Element
    properties
        node_i % local index 1
        node_j % local index 2
        node_m % local index 3
        B
        K
        % map global index (1,3) to local index (1,85)
        % (containers.Map object)
        index_map
        index
    end
end