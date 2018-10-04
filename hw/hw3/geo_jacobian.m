% geo_jacobian Calculate geometric jacobian of a robot 
%
% J = geo_jacobian(robot) is the 6 x N geometric jacobian where
% N is the number of joints of the robot
% robot is assumed to be a serial link object, using DH parameters
 
function J = geo_jacobian(robot,q)
  N = length(robot.links);
  J = zeros(6,N);
  T_n0 = robot.fkine(q).T;
  o_n = T_n0(1:3,4);

  for i = 1:N
    T = robot.A(1:i-1, q(1:i-1)).T;
    z_i = T(1:3, 3);
    if robot.links(i).isrevolute
      o_i = T(1:3, 4);
      J(1:3,i) = cross(z_i, o_n - o_i);
      J(4:6,i) = z_i;
    else
      J(1:3,i) = z_i;
      J(4:6,i) = 0;
    end
  end
end
