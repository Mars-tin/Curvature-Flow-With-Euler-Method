function len = LENGTH(x, M)
    x_1a = DIFT(x(1,:), M);
    x_2a = DIFT(x(2,:), M);
    x_a = sqrt(x_1a.^2 + x_2a.^2);
    len = (sum(x_a) - x_a(1)/2 - x_a(M)/2) *2*pi/M;
end