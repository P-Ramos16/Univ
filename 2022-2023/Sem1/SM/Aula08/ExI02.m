load('Guitar03.mat')

Ta = 1/fa;

[X, f] = espetro(x, Ta);

figure(1);

p = plot(f, abs(X), 'b');
legend("f");
title('Ex02');
xlabel('f (Hz)');
ylabel('X');
axis([-4000 4000 0 6e-3]);
grid on;