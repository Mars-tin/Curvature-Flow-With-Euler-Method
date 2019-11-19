function n = NORM(x, M)
    x_1a = DIFT(x(1,:), M);
    x_2a = DIFT(x(2,:), M);
    x_a = sqrt(x_1a.^2 + x_2a.^2);
    n1 = x_2a ./ x_a;
    n2 = -x_1a ./ x_a;
    n = [n1; n2];
end