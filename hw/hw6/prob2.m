%calling the file as a function that returns a left and right arm
load('desired_accel.mat')
[left, right] = mdl_baxter('sim')

q_d = diff(q)./diff(t);
q_d = [zeros(1,7) ; q_d];

q_dd = diff(q_d)./diff(t);
q_dd = [zeros(1,7); q_dd];


tau = zeros(7, 1001);
for i = 1:1001
    tau(:,i) = left.inertia(q(i,:))*q_dd(i,:)' + ...
             left.coriolis(q(i,:),q_d(i,:))*q_d(i,:)' + ...
             left.gravload(q(i,:))';
    i
end
tau = tau';

for i = 1:7
    subplot(3,3,i);
    plot(t,tau(:,i), ...
    'LineWidth', 2);
    title(strcat('Tau ',string(i)));
end

