clear all;

N = 1e4;
Ta = 0.001;


fa = 1/Ta;

[x, t] = geraSinal(N, Ta);

[X, f] = espetro(x, Ta);

Hf0 = zeros(1, length(X));
Hf0(f>-2&f<2) = 1;
xFiltered = X.*Hf0';


[xReconst, t] = reconstroi(xFiltered, f);


figure(1);
hold on
plot(t, x, 'b')
plot(t, xReconst, 'r', 'LineWidth',3)
title('Ex02');
xlabel('t (s)');
ylabel('xReconst');
axis([0 10 -2 2]);
grid on;
hold off


figure(2);
plot(f, abs(xFiltered))
title('Ex02');
xlabel('f (Hz)');
ylabel('xFiltered');
axis([-25 25 0 0.55]);
grid on;
hold on