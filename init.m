clear all
clc

% Initialize entire mesh

elements(128) = Element;
nodes(85) = Node;

index = 1;
for i=0:15
    for j=0:3
        odd = 2*j+1 + 8*i;
        elements(odd).index = odd;
        
        % Create node i
        node_i = Node;
        node_i.x = i*0.3125;
        node_i.y = j*1.25;
        node_i.index = index;
        % Add node to total node list
        if isempty(nodes(index).elements)
            nodes(index) = node_i;
        elseif isempty(nodes(index).x)
            nodes(index).x = node_i.x;
            nodes(index).y = node_i.y;
            nodes(index).index = index;
        end
        % Append element to the node's list of elements
        nodes(index).elements = [nodes(index).elements, odd];
        % Initialize index map with node i
        % Remember that i -> 1, j -> 2, m -> 3
        elements(odd).index_map = containers.Map({index},{1});
        % Save node i to the element
        elements(odd).node_i = index;
        
        % Create node m
        node_m = Node;
        node_m.x = node_i.x;
        node_m.y = node_i.y + 1.25;
        node_m.index = node_i.index + 1;
        % Add node to total node list
        if isempty(nodes(index+1).elements)
            nodes(index+1) = node_m;
        elseif isempty(nodes(index+1).x)
            nodes(index+1).x = node_m.x;
            nodes(index+1).y = node_m.y;
            nodes(index+1).index = index+1;
        end
        % Append element to the node's list of elements
        nodes(index+1).elements = [nodes(index+1).elements, odd];
        % Add node to element(odd)'s index map
        elements(odd).index_map(index+1) = 3; 
        % Save node m to the element
        elements(odd).node_m = index+1;
        
        % Create node j
        node_j = Node;
        node_j.x = node_i.x + 0.3125;
        node_j.y = node_i.y;
        node_j.index = node_i.index + 5;
        % Add node to total node list
        if isempty(nodes(index+5).elements)
            nodes(index+5) = node_j;
        elseif isempty(nodes(index+5).x)
            nodes(index+5).x = node_j.x;
            nodes(index+5).y = node_j.y;
            nodes(index+5).index = index+5;
        end
        % Append element to the node's list of elements
        nodes(index+5).elements = [nodes(index+5).elements, odd];
        % Add node to element(odd)'s index map
        elements(odd).index_map(index+5) = 2;
        % Save node j
        elements(odd).node_j = index+5;
        
        even = 2*(j+1) + 8*i;
        elements(even).index = even;
        
        elements(even).node_i = elements(odd).node_m;
        elements(even).node_j = elements(odd).node_j;
        
        % Create node m for the even element
        node_m_even = Node;
        node_m_even.y = nodes(elements(even).node_i).y;
        node_m_even.x = nodes(elements(even).node_j).x;
        node_m_even.index = index + 6;
        if isempty(nodes(index+6).elements)
            nodes(index+6) = node_j;
        elseif isempty(nodes(index+6).x)
            nodes(index+6).x = node_j.x;
            nodes(index+6).y = node_j.y;
        end
        nodes(index+6).index = index+6;
        % Fill even element's index map
        elements(even).index_map = containers.Map({index+1,index+5,index+6},{1,2,3});
        % Append even element to each node
        nodes(index+1).elements = [nodes(index+1).elements, even];
        nodes(index+5).elements = [nodes(index+5).elements, even];
        nodes(index+6).elements = [nodes(index+6).elements, even];
        
        % Save node m for the even element
        elements(even).node_m = index+6;
        
        index = index + 1;
    end
    index = index + 1;
end

clear node_i node_j node_m node_m_even
clear i j odd even index

