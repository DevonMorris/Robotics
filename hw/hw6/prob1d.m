syms m1 m2 m3 q1 q2 q3 Ixx Iyy Izz dq1 dq2 dq3 g ddq1 ddq2 ddq3 real;

q = [q1 q2 q3];
dq = [dq1 dq2 dq3];
ddq = [ddq1 ddq2 ddq3];
m = [m1 m2 m3];

I = [Ixx 0 0; 0 Iyy 0; 0 0 Izz];

L(1) = Link([q1 0 0.4 0]);
L(2) = Link([q2 0 0.4 0]);
L(3) = Link([q3 0 0.4 0]);
bot = SerialLink(L);

% Caclculation of mass matrix
M = sym(zeros(3));
for i = 1:3
    T = bot.A(1:i, q(1:i)).T;
    R = T(1:3, 1:3);
    p_com = T(1:3, 4) + sym(R*[-0.2; 0; 0]);
    J = my_jacob(bot, p_com ,q, 3);
    for j = 1:3-i
        J(:,4 - j) = 0;
    end
    J_v = J(1:3,:);
    J_w = J(4:6,:);
    M = M + m(i)*J_v'*J_v;
    M = M + J_w'*R*I*R'*J_w;

end

% Calculation of coriolis terms
C = sym(zeros(3,3,3));
for i = 1:3
    for j = 1:3
        for k = 1:3
            C(i,j,k) = 0.5*(diff(M(k,j),q(i)) + diff(M(k,i),q(j)) - diff(M(i,j),q(k)));
        end
    end
end

% Calculation of gravity terms
g = sym([0; 1; 0]);
P = sym(0);
for i = 1:3
    T = bot.A(1:i, q(1:i)).T;
    R = T(1:3, 1:3);
    p_com = T(1:3, 4) + sym(R*[-0.2; 0; 0]);
    P = P + m(i)*g'*p_com;
end

G = sym(zeros(3,1));
for i = 1:3
    G(i) = diff(P,q(i));
end

% Make things pretty
M = simplify(M);
C = simplify(C);
G = simplify(G);



% Dynamic equations
eq = sym(zeros(3,1));
for k = 1:3
    for j = 1:3
       eq(k) = eq(k) + M(k,j)*ddq(j);
    end

    for i = 1:3
        for j = 1:3
            eq(k) = eq(k) + C(i,j,k)*dq(i)*dq(j);
        end
    end
    
    eq(k) = eq(k) + G(k);
end
simplify(eq)

% Function to calculate jacobian at arbitrary position with respect to arbitrary number of joints
function [J] = my_jacob(bot, pos, q, n)
   J = sym(zeros(6,n));
   for i = 1:n
     T = bot.A(1:i-1, q(1:i-1)).T;
     z_i = T(1:3,3);
     o_i = T(1:3,4);
     if bot.links(i).isrevolute
       J(1:3,i) = cross(z_i, pos - o_i);
       J(4:6,i) = z_i;
     else
       J(1:3,i) = z_i;
       J(4:6,i) = 0;
     end
   end 
end
