% Elements have been initialized with associated nodes
% This script obtains the B matrix for each element

A = (1.25*0.3125)/2; % Area per element

for e=1:128
    % Calculate beta i,j,m and gamma i,j,m
    beta_i = nodes(elements(e).node_j).y - nodes(elements(e).node_m).y;
    beta_j = nodes(elements(e).node_m).y - nodes(elements(e).node_i).y;
    beta_m = nodes(elements(e).node_i).y - nodes(elements(e).node_j).y;
   
    gamma_i = nodes(elements(e).node_m).x - nodes(elements(e).node_j).x;
    gamma_j = nodes(elements(e).node_i).x - nodes(elements(e).node_m).x;
    gamma_m = nodes(elements(e).node_j).x - nodes(elements(e).node_i).x;
    
    % Now construct B matrix for the kth element
    elements(e).B = (1/(2*A))*[beta_i 0 beta_j 0 beta_m 0; 
                     0 gamma_i 0 gamma_j 0 gamma_m; 
                     gamma_i beta_i gamma_j beta_j gamma_m beta_m];
end

clear beta_i beta_j beta_m gamma_i gamma_j gamma_m e