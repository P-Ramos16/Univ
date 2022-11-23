Ta = 0.05;      % sampling period

T = 5;

t = 0:Ta:T;

x = sin(2*pi*t);

hold on
figure(1);
plot(t, x, 'o');
legend("Sinal original");
[X, ts] = reconstroiSinal(x, Ta);
plot(ts, X, '--');
legend("Sinal reconst.");
title('Ex02_a');
xlabel('x');
ylabel('y');
axis([0 5 -1.25 1.25]);
grid on;
hold off;