clear

Ta = 0.05;      % sampling period

f0 = 1;         % signal frequency

T0 = 1/f0;    % signal period
Np = 5;       % number of periods

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

x = (square(2*pi*f0*t) + 1) / 2;


[X, f] = espetro(x, Ta);

hold on
p = plot(f, abs(X), 'b');
%p = plot(t, x, 'g');
p(1).LineWidth = 2;
legend("f");
title('Ex03_d');
xlabel('f (Hz)');
ylabel('X');
grid on;
hold off