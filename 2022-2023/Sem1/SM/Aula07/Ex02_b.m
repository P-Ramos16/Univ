Ta = 0.04;      % sampling period

T = 5;

t = 0:Ta:T;

x = sin(5*2*pi*t) + cos(6*2*pi*t) + cos(7*2*pi*t - pi/4);

hold on
figure(1);
plot(t, x, 'o');
legend("Sinal original");
[X, t] = reconstroiSinal(x, Ta);
plot(t, X, 'r');
legend("Sinal reconst.");
title('Ex02_b');
xlabel('x');
ylabel('y');
axis([0 5 -3 3]);
grid on;
hold off;