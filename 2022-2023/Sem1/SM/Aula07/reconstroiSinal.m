function [y, ts] = reconstroiSinal(x, Ta)
    %RECONSTROISINAL Summary of this function goes here
    %   Detailed explanation goes here
    
    N = length(x);

    y = zeros(100*N, 1);
    fa = 1/Ta;
    fs = 100*fa;
    ts = [0:(length(y)-1)]'*(1/fs);
    
    for n = 1:1:N-1
        y = y + x(n) * sinc(fa * (ts - n*Ta));
    end
end

