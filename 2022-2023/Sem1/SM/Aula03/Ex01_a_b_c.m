Ta = 0.01;

hold on


% Alinea A
t = 0:Ta:2;
ya = 2 * sin(4 * pi * t);

subplot(3, 1, 1)
% x(t) = 2 * sin(2pi * f0 * t), logo:
% f0 = 2;  T = 1/f0 = 1/2;   
p = plot(t, ya, 'r');
p(1).LineWidth = 2;

title('Alinea A');
xlabel('x');
ylabel('y');
axis([0 2 -2.5 2.5]);
legend("2 * sin(4 * pi * t)");


% Alinea B
yb = sin(10 * pi * t + pi / 2);

subplot(3, 1, 2)
p = plot(t, yb, 'g');
p(1).LineWidth = 2;

title('Alinea B');
xlabel('x');
ylabel('y');
axis([0 2 -2.5 2.5]);
legend("sin(10 * pi * t + pi / 2)");


% Alinea C
yc = sin(20 * pi * t + 70 * pi / 180) + sin(20 * pi * t + 200* pi / 180);

subplot(3, 1, 3)
p = plot(t, yc, 'b');
p(1).LineWidth = 2;

title('Alinea C');
xlabel('x');
ylabel('y');
axis([0 2 -2.5 2.5]);
legend("sin(20 * pi * t + 70 * pi / 180) + sin(20 * pi * t + 200* pi / 180)");

hold off

powerYa = powerVector(ya, Ta, 2)
powerYb = powerVector(yb, Ta, 5)
powerYc = powerVector(yc, Ta, 10)
