Xi = eye(4);
Xi(1:3,1:3) = roty(pi/4)*rotz(pi/4);
Xi(1:3, 4) = [1 1 1];

plot_cube(Xi)

function plot_cube(Xi)
    % Xi is a homogeneous transform matrix
    figure()
    cube = [1 1 1; 1 1 -1; 1 -1 -1; 1 -1 1; 
        1 1 1; 1 -1 1; -1 -1 1; -1 1 1;
        1 1 1; -1 1 1; -1 -1 1; -1 -1 -1;
        1 -1 -1; 1 1 -1; -1 1 -1; -1 -1 -1;
        -1 1 -1; -1 1 1]';
    size(cube)
    cube = [cube; ones(1, size(cube, 2))];
    size(cube)
    cube = Xi*cube;

    plot3(cube(1,:),cube(2,:),cube(3,:));
    xlim([-10, 10]);
    ylim([-10, 10]);
    zlim([-10, 10]);

end