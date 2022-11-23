function [X, f] = espetro(x, Ta)

    N = length(x);
    
    X = fftshift(fft(x)) / N;

    fa = 1 / Ta;
    f = (0:N-1) * (fa/N) - (fa/2);

end