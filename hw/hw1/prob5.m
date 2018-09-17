R = rotz(pi/2)*roty(pi/3)*rotx(pi/6);
Xi = eye(4);
Xi(1:3, 1:3) = R;

trplot(Xi);

R

vec = [1; 2; 3];
R*vec

Rinv = R'

R*Rinv

Rinv*R

det(R)

det(Rinv)
