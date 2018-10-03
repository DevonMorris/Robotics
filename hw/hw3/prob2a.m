L1 = Link([0. 0.3 0 pi/2]);
L2 = Link([0. 0. 0.3 0]);
L3 = Link([0. 0. 0.3 0]);

robot = SerialLink([L1 L2 L3]);

angles = random('unif', -pi, pi, 6, 3);
angles(6, :) = [0 pi/2 0];

for i = 1:6
  robot.jacob0(angles(i,:))
end
