function avg = CPUTIME(M, N, t0, tf)
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
    
    time = zeros(1, N+1);
    
    for i = 0 : N
        f = @() EULERMETHOD(x, M, j);
        time(i+1) = timeit(f);
        x = EULERMETHOD(x, M, j);
    end
    avg = sum(time)/(N+1);
end

function x = EULERMETHOD(x, M, j)
	x_dot = XDOT(x, M);
	x = x + x_dot * j;
end