% Get elasticity matrix D for the system

E = 210e9; % Modulus of elasticity
v = 0.33; % Poisson ratio

c = E/(1-v^2);

D = c*[1 v 0; v 1 0; 0 0 (1-v)/2];

clear c