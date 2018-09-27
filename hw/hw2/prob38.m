d_1 = 0.5;
a_2 = 0.4;
d_4 = 0.3;
d_6 = 0.2;

L1 = Link([0 d_1 0 -pi/2 0 0]);
L2 = Link([0 0 a_2 -pi/2 0 0]);
L3 = Link([0 0 0 pi/2 0 pi/2]);
L4 = Link([0 d_4 0 -pi/2 0 pi/2]);
L5 = Link([0 0 0 pi/2 0 0]);
L6 = Link([0 d_6 0 0 0 0]);

bot = SerialLink([L1 L2 L3 L4 L5 L6]);

angles = random('unif', -pi, pi, 50000, 6);

T = bot.fkine(angles).T;
endpos = T(1:3,4,:);
endpos = reshape(endpos, [3 50000])

scatter3(endpos(1,:), endpos(2,:), endpos(3,:), 1, vecnorm(endpos,2,1));
hold on
bot.plot(angles(1,:));
