Xi0 = eye(4);

R = rotz(pi/2)*roty(pi/3)*rotx(pi/6);
Xi = eye(4);
Xi(1:3, 1:3) = R;
Xi(1:3, 4) = [1; 2; 3];

tranimate(Xi0, Xi);

vec = [1; 2; 3];
Xi*[vec; 1]

Xiinv = eye(4);
Xiinv(1:3, 1:3) = R';
Xiinv(1:3, 4) = -R'*vec

Xi*Xiinv

Xiinv*Xi
