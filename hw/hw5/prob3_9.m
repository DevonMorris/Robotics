max_speed = 0.025;
fast = true;
steps = 5;

while fast
    [S, SD, SDD] = tpoly(0, 1, steps);
    if max(SD) < max_speed
        fast = false;
    end
    steps = steps + 1;
end
steps

fast = true;
steps = 5;

while fast
    [S, SD, SDD] = lspb(0, 1, steps);
    if max(SD) < max_speed
        fast = false;
    end
    steps = steps + 1;
end
steps
