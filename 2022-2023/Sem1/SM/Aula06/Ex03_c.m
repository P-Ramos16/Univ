clear

Ta = 0.001;      % sampling period

f0 = 10;         % signal frequency
f1 = 20;

T0 = 1;    % signal period
Np = 100;       % number of periods

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

x = 10 + 14*sin(2*pi*f0*t - pi/3) + 8*cos(2*pi*f1*t); %signal to process


[X, f] = espetro(x, Ta);

hold on
p = plot(f, abs(X), 'b');
%p = plot(t, x, 'g');
p(1).LineWidth = 2;
legend("f");
title('Ex03_b');
xlabel('f (Hz)');
ylabel('X');
axis([-50 50 0 12]);
grid on;
hold off
