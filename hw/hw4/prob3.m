%MDL_HW_2 

clear L

%%%%%%%%%%%%% theta, d, a, alpha, revolute or prismatic, offset
L(1) = Link([ 0     0.2     0          -pi/2    0        0], 'standard');
L(2) = Link([ 0 	0.      0.2        0        0        0], 'standard');
L(3) = Link([ 0     0.      0         pi/2    0         pi/2], 'standard');
L(4) = Link([ 0     0.4     0        -pi/2    0         pi/2], 'standard');
L(5) = Link([ 0     0.0     0         pi/2    0         0   ], 'standard');
L(6) = Link([ 0     0.4     0          0      0         0], 'standard');

%% defining the robot now
bot = SerialLink(L, 'name', 'HW 2', ...
    'manufacturer', 'Killpack Inc.');

% some useful poses
qz = [0 0 0 0 0 0]'; % zero angles, L shaped pose
qe = [pi/2 pi/2 pi/2 pi/2 pi/2 pi/2]';

N = 10000;

angles = random('unif', -pi, pi/2, 10, 6);
T = bot.fkine(angles).T;

% Do numerical inverse kinematics
for i = 1:1
  Te = T(:,:,i);
  q0 = qe;
  q1 = ikine_simple(bot, Te, q0, N, 1e-6);
  q2 = ikine_LM(bot, Te, q0, N, 1e-6);
end

figure(1)
bot.plot(angles(1,:));

clear L

function q = ikine_simple(bot, T, q0, N, eps)
  n = 0;
  alpha = 0.01;
  ndel = 1;
  q = q0;
  while n < N && ndel > eps
    J = bot.jacob0(q);
    J = J(1:3,:);
    K = bot.fkine(q).T;
    err = T(1:3,4) - K(1:3,4);
    del = alpha*J'*err;
    q = q + del;
    n = n + 1;
    ndel = norm(del);
  end
  q = q';
end

function q = ikine_LM(bot, T, q0, N, eps)
  n = 0;
  alpha = 0.01;
  lamb = 0.001;
  ndel = 1;
  q = q0;
  while n < N && ndel > eps
    J = bot.jacobe(q);
    J = J(1:3,:);
    K = bot.fkine(q).T;
    err = T(1:3,4) - K(1:3,4);
    del = alpha*J'*inv(J*J' + lamb*eye(3))*err;
    q = q + del;
    n = n + 1;
    ndel = norm(del);
  end
  q = q';
end
