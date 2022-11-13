Ta = 0.2;      % sampling period

T = 5;

t = 0:Ta:T;

x = sin(2*pi*t);

hold on
figure(1);
plot(t, x, 'o');
legend("Sinal original");
[X, t] = reconstroiSinal(x, Ta);
plot(t, X, '--');
legend("Sinal reconst.");
title('Ex02_a');
xlabel('x');
ylabel('y');
axis([0 5 -1.25 1.25]);
grid on;
hold off;