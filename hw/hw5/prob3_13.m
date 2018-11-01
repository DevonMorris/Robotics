acc_time = linspace(0, 5, 1000);
via = SO2(30, 'deg') * [-1 1; 1 1; 1 -1; -1 -1]';

figure(1);
q0 = mstraj(via(:,[2 3 4 1])', [2,1], [], via(:,1)', 0.01, 1, [10 10], [-5 -5]);
plot(q0(:,1), q0(:,2));

times = [];
for a = acc_time
    q0 = mstraj(via(:,[2 3 4 1])', [2,1], [], via(:,1)', 0.01, a);
    times = [times numrows(q0)];
end

figure(2);
plot(acc_time, times);
