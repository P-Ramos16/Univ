function [x, t] = reconstroi(X, f)

    Fa = max(f) * 2;
    Ta = 1 / Fa;

    N = length(X);    
    x = (ifft(ifftshift(X))) * N;
    t = (0:(N-1)) * Ta;

end