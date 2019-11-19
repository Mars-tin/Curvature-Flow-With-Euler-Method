function g = DIFT(f, M)
    f_fft = fftshift(fft(f,M));
    g_fft = zeros(1, M);
    for k = -M/2 : M/2-1
        g_fft(k+M/2+1) = f_fft(k+M/2+1) * (1i * k); 
    end
    g_fft = fftshift(g_fft);
    g = real(ifft(g_fft, M));
end