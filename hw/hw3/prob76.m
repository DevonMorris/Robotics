mdl_puma560;


angles = random('unif', -pi, pi, 100, 6);

p560
T = p560.fkine(angles).T;
pos = T(1:3, 4,:);
pos = reshape(pos, [3 100]);

p560.links(3).d = p560.links(3).d + 0.005

T_pert = p560.fkine(angles).T;
pos_pert = T_pert(1:3, 4, :);
pos_pert = reshape(pos_pert, [3 100]);

e = vecnorm(pos - pos_pert, 2, 1);

mean(e)
max(e)

mdl_puma560;
angles(:, 2) = angles(:, 2) + 0.1;
T_pert = p560.fkine(angles).T;
pos_pert = T_pert(1:3, 4, :);
pos_pert = reshape(pos_pert, [3 100]);

e = vecnorm(pos - pos_pert, 2, 1);

mean(e)
max(e)
