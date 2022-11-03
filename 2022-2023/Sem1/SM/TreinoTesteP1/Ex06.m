Ta = 2000;      % sampling period

Np = 2          % number of periods

f0 = 11;        % signal frequency
T0 = 1 / f0;    % signal period

f1 = 189;        % signal frequency
T1 = 1 / f1;    % signal period

f = 1

N = round(Np*T0/Ta);
t = (0:N-1)'*Ta;

X = zeros(Ta);
X(11) = 1;
X(189) = 1;

[xReconstroi, tReconstroi] = reconstroi(X, f);

hold on
p = plot(tReconstroi, xReconstroi, 'b');
p(1).LineWidth = 1;
axis([0 50 -2 2]);
legend("x");
title('Ex04_a');
xlabel('t');
ylabel('Amplitude');
grid on;
hold off