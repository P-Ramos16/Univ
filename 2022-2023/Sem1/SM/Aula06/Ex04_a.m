Ta = 0.05;      % sampling period

f0 = 1;         % signal frequency
T0 = 1 / f0;    % signal period
Np = 100;       % number of periods

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

x = sin(2*pi*f0*t); %signal to process

[X, f] = espetro(x, Ta);

[xReconstroi, tReconstroi] = reconstroi(X, f);

hold on
p = plot(tReconstroi, xReconstroi, 'b');
p(1).LineWidth = 1;
legend("x");
title('Ex04_a');
xlabel('t');
ylabel('Amplitude');
grid on;
hold off