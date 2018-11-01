v = [2, 3, 4];
vn = v/norm(v);
th = 0.5;


omega = skew(vn);
R1 = expm(th*omega)

R2 = angvec2tr(th, vn)

R3 = eye(3) + sin(th)*omega + (1 - cos(th))*omega^2

q = [cos(th/2) vn*sin(th/2)]
