function x_dot = XDOT(x, M)
    x_1a = DIFT(x(1,:), M);
    x_2a = DIFT(x(2,:), M);
    x_1aa = DIFT(x_1a, M);
    x_2aa = DIFT(x_2a, M);
    x_a = sqrt(x_1a.^2 + x_2a.^2);
    kappa = (x_2a .* x_1aa - x_1a .* x_2aa) ./ x_a.^3;
    n1 = x_2a ./ x_a;
    n2 = -x_1a ./ x_a;
    x_dot1 = n1 .* kappa;
    x_dot2 = n2 .* kappa;
    x_dot = [x_dot1; x_dot2];
end