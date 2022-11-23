N = 1e4;
Ta = 0.001;

[x, t] = geraSinal(N, Ta);


figure(1);
plot(t, x)
title('Ex02');
xlabel('f (Hz)');
ylabel('X');
axis([0 10 -2 2]);
grid on;
hold on


[X, f] = espetro(x, Ta);



figure(2);
plot(f, abs(X))
title('Ex02');
xlabel('f (Hz)');
ylabel('X');
axis([-25 25 0 0.55]);
grid on;
hold on