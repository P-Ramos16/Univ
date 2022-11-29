load('Guitar02.mat')

fa = 1/Ta;

[X, f] = espetro(x, Ta);

Hf0 = zeros(1, length(X));
Hf1 = zeros(1, length(X));
Hf0(f>865&f<871) = 1;
Hf0(f<-865&f>-871) = 1;
Hf1(f>1297&f<1303) = 1;
Hf1(f<-1297&f>-1303) = 1;

xFiltered0 = X.*Hf0';
xFiltered1 = X.*Hf1';

xFiltradoFinal = xFiltered0 + xFiltered1;

figure(1);
title('Ex02');
xlabel('f (Hz)');
ylabel('X');
plot(f, abs(xFiltradoFinal));
axis([-1500 1500 0 6e-3]);
grid on;


[xReconst, t] = reconstroi(xFiltradoFinal, f); % xFiltered
t
sound(xReconst, t);

figure(1);
plot(t, xReconst);
axis([0 8 -0.1 0.1]);
grid on;

hold off