init;
getD;
getB;
getK;
getTotalK;

% Get displacement at node 81 (where the force of 2000N is applied)
i = 81*2 - 1;
K_sub = K(i:i+1,i:i+1);
R = [0;2000];
U = linsolve(K_sub, R);
disp('Displacement at node 81:')
disp(U)

%% Concluding notes
% Result is 0.1358e-5 meters in the y direction
% U represents (x,y) displacement of node 81

% Resulting U is 2 orders of magnitude smaller than ANSYS simulations,
% but the method used by ANSYS is probably very different

% The displacement is 0 in the x direction since there is no force in the
% x direction

% When a diagonal force is applied, there is more displacement in the x
% direction than y direction. This is what we expect, which somewhat
% validates the code. Further validation would have to be done by
% comparing randomly selected parts of the K matrix with hand-calculated
% values.

