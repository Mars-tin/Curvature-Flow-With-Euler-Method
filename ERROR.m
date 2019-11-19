function err = ERROR(M, N, t0, tf)
    % N  = #time steps
    % M  = #spatial discretization
    % t0 = initial time (t0 = 0)
    % tf = final time (tf = 4)

    x1_ = @(a) (4+cos(3*a)).*cos(a);
    x2_ = @(a) (4+cos(3*a)).*sin(a);
    
    h = 2*pi/M;
    a = linspace(0, 2*pi-h, M);
    x = [x1_(a); x2_(a)];

    j = (tf - t0)/N;
    
    for i = 0 : N
        x_dot = XDOT(x, M);
        if i == N
            err = LENGTH(x, M);
        end  
    	x = x + x_dot * j;
    end
end