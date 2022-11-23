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