clear

Ta = 0.05;      % sampling period

f0 = 5;         % signal frequency
f1 = 6;
f2 = 7;

T0 = 1;    % signal period
Np = 50;       % number of periods

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

x = sin(2*pi*f0*t) + cos(2*pi*f1*t) + cos(2*pi*f2*t - pi/4); % signal to process


[X, f] = espetro(x, Ta);

hold on
p = plot(f, abs(X), 'b');
%p = plot(t, x, 'g');
p(1).LineWidth = 2;
legend("f");
title('Ex03_b');
xlabel('f (Hz)');
ylabel('X');
grid on;
hold off