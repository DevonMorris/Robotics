% Make Links
L1 = Link([0 1 0 -pi/2]);
L2 = Link([0 0 1 0]);
L3 = Link([0 0 0 pi/2 0 pi/2]);
L4 = Link([0 1 0 -pi/2 0 pi/2]);
L5 = Link([0 0 0 pi/2]);
L6 = Link([0 1 0 0]);

bot = SerialLink([L1 L2 L3 L4 L5 L6]);
bot.name = "2f";

% prime the pump
q = 2*pi*rand(1,6) - pi
manip = bot.maniplty(q);

% Check the manipulability of matrix
while manip > 1e-6
  q = 2*pi*rand(1,6) - pi;
  manip = bot.maniplty(q);
end

manip
bot.plot(q);
J = bot.jacob0(q)

[U,S,V] = svd(J);
sig_min = S(end,end)
nspc = U(:,end)
