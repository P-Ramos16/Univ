% F(m) = 1/N Somatorio n=0, N-1 (f(n) e^-j*2*pi*n*m/N)

T = 0.001;
Ta = 0.001;
fa = 1/Ta;

t = (0.99999) * Ta;
x = sin(2*pi*10*t);

plot(abs(fft(x)));
zoom on;
N = length(x);

