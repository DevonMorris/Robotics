function [y] = square(t)

y = [0; 0]
tp = mod(t,2*pi) - pi/4;

if (tp < pi/4)
    y(1) = 1;
    y(2) = tan(tp);
elseif (tp < 3*pi/4)
    y(1) = cot(tp);
    y(2) = 1;
elseif (tp < 5*pi/4)
    y(1) = -1;
    y(2) = -tan(tp);
elseif (tp < 7*pi/4)
    y(1) = -cot(tp);
    y(2) = -1;
end


end
