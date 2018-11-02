mdl_puma560;
N = length(p560.links);
K = 100;

min_q = -pi/4;
max_q = pi/4;

q = (min_q - max_q)*(rand(K, N) - 0.5);
T = p560.fkine(q);


tic; p560.ikine(T); toc
tic; p560.ikine6s(T); toc
