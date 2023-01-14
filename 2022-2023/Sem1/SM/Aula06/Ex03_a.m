Ta = 0.05;      % sampling period

f0 = 1;         % signal frequency
T0 = 1 / f0;    % signal period
Np = 100;       % number of periods

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

x = sin(2*pi*f0*t); %signal to process

[X, f] = espetro(x, Ta);

hold on
p = plot(f, abs(X), 'b');
%p = plot(t, x, 'g');
axis([-5 5 0 1])
p(1).LineWidth = 1;
legend("f");
title('Ex03_a');
xlabel('f (Hz)');
ylabel('X');
grid on;
hold off