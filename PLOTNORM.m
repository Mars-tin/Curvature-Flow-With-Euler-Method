function PLOTNORM(x,n)
    plot(x(1,:), x(2,:));
    axis equal
    hold on
    %quiver(x(1,:), x(2,:), n(1,:), n(2,:));
    %axis([-15 15 -10 10])
    %hold off
end