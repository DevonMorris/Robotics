R0 = SO3.Rz(pi/2)*SO3.Rx(pi/4);
R1 = SO3.Ry(pi/3)*SO3.Ry(pi/4);

rpy0 = R0.torpy();
rpy1 = R1.torpy();

rpy = mtraj(@tpoly, rpy0, rpy1, 50);
SO3.rpy( rpy ).animate;

q0 = R0.UnitQuaternion;
q1 = R1.UnitQuaternion;

q = interp(q0, q1, 50);
q.animate();
