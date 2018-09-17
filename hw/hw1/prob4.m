R3d = rotx(pi/6);
R = R3d(2:3, 2:3);
Xi = eye(3);
Xi(1:2, 1:2) = R;

trplot2(Xi);

R

vec = [1; 2];
R*vec

Rinv = R'

R*Rinv

Rinv*R

det(R)

det(Rinv)
