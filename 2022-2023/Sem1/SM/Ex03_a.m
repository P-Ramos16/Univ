Ta = 0.05;      % sampling period

f0 = 1;         % signal frequency
T0 = 1 / f0;    % signal period
Np = 100;       % number of periods

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

x = 20 * sin(3*pi*t - 2*pi/3) + 16*sin(7*pi*t + 2*pi/3) + 10*sin(9*pi*t - pi/4);

[X, f] = espetro(x, Ta);

hold on
p = plot(f, abs(X), 'b');
%p = plot(t, x, 'g');
p(1).LineWidth = 1;
legend("f");
title('Ex03_a');
xlabel('f (Hz)');
axis([-5 5 0 12.5]);
ylabel('X');
grid on;
hold off