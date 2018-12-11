function v = mytr2delta(T1,T2)
v = zeros(6,1)
p1 = T1(1:3,4)
p2 = T2(1:3,4)

v(1:3) = p2 - p1;

R1 = T1(1:3,1:3);
R2 = T2(1:3,1:3);
R = R2'*R1;
u_skew = logm(R);

v(4) = u_skew(3,2);
v(5) = -u_skew(3,1);
v(6) = u_skew(2,1);

end
