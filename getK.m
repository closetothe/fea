% Get stiffness matrix K for each element

t = 0.05; % Beam thickness

for i=1:128
    B = elements(i).B;
    B_transpose = elements(i).B.';
    elements(i).K = t * A * B_transpose * D * B;
end

clear i