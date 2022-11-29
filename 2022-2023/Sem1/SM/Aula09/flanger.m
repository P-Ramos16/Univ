function y = flanger(x, fa, MaxDelay, Freq)
    N = length(x);
    y = zeros(N,1);
    delay = rand(1,1)*MaxDelay;

    for n = 1:N
        fsig = sin(2*pi*Freq*delay*n*fa);
        x(n) = x(n) + fsig;
    end

    Px = x'*x/N;
    Py = y'*y/N;
    y = y*sqrt(Px/Py);
end