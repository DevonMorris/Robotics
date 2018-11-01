R_a = rotx(pi/3)
R_b = rotz(pi/6)

R_ab = R_a'*R_b
R_ba = R_b'*R_a

a_ab = vex(logm(R_ab));
th_ab = norm(a_ab)
a_ab = a_ab/th_ab

a_ba = vex(logm(R_ba));
th_ba = norm(a_ba)
a_ba = a_ba/th_ba
