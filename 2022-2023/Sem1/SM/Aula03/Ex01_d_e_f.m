Ta = 0.01;

hold on


% Alinea D
t = 0:Ta:5;
yd = sin(6 * pi * t) + sin(8 * pi * t);

subplot(3, 1, 1)
p = plot(t, yd, 'r');
p(1).LineWidth = 2;

title('Alinea D');
xlabel('x');
ylabel('y');
axis([0 5 -2.5 2.5]);
legend("sin(6 * pi * t) + sin(8 * pi * t)");


% Alinea E
ye = sin(6 * pi * t) + sin(8 * pi * t + 0.1);

subplot(3, 1, 2)
p = plot(t, ye, 'g');
p(1).LineWidth = 2;

title('Alinea E');
xlabel('x');
ylabel('y');
axis([0 5 -2.5 2.5]);
legend("sin(6 * pi * t) + sin(8 * pi * t + 0.1)");


% Alinea F
yf = sin(6 * pi * t) + sin(7 * pi * t) + sin(8 * pi * t);

subplot(3, 1, 3)
p = plot(t, yf, 'b');
p(1).LineWidth = 2;

title('Alinea F');
xlabel('x');
ylabel('y');
axis([0 5 -3.5 3.5]);
legend("sin(6 * pi * t) + sin(7 * pi * t) + sin(8 * pi * t);");

hold off

powerYd = powerVector(yd, Ta, 1)
powerYe = powerVector(ye, Ta, 1)
powerYf = powerVector(yf, Ta, 0.5)