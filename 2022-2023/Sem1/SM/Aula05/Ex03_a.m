Ta = 0.001;
f0 = 1;
Np = 100 - 2
N = round(Np/(f0*Ta))
t = [0: (N-1)]'*Ta;
T0 = 1 / f0;

x = sin(2*pi * t);

[X, f] = espetro(x, Ta);

p = plot(f', X, 'b');
p(1).LineWidth = 4;
legend("f");
title('Ex01');
xlabel('x');
ylabel('f');
grid on;
