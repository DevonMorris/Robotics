function q_cmd = traj()
Q0 = zeros(1,6);
QF = 2*pi*rand(1,6);

q_cmd = jtraj(Q0, QF, 1001);
end
