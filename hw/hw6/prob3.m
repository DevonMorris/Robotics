q_sim = out.get('q_sim');
qd_sim = out.get('qd_sim');
qdd_sim = out.get('qdd_sim');
t_sim = out.get('t_sim');

N = size(time);
q = zeros(N(1), 6);
qd = zeros(N(1), 6);
qdd = zeros(N(1), 6);

for i = 1:N-1
    dt = time(i+1) - time(i);
    dder = p560.accel(q(i,:), qd(i,:), torque(i,:));
    qdd(i+1,:) = dder';
    qd(i+1,:) = qd(i,:) + dt*qdd(i,:);
    q(i+1,:) = q(i,:) + dt*qd(i,:) + dt^2*qdd(i,:)/2;
    i
end

figure
subplot(2,2,1)
plot(time,q');
title('q euler');
subplot(2,2,2)
plot(time,qd');
title('qdot euler');
subplot(2,2,3)
plot(time,qdd');
title('qddot euler');

figure
subplot(2,2,1)
plot(t_sim,q_sim);
title('q sim');
subplot(2,2,2)
plot(t_sim,qd_sim);
title('qdot sim');
subplot(2,2,3)
plot(t_sim,qdd_sim);
title('qddot sim');
