Ta = 0.01;


% Alinea A
t = 0:Ta:5;
T = 2;

y = sin(2 * pi * t);

p = plot(t, y, 'r');
p(1).LineWidth = 2;

title('Alinea A');
xlabel('x');
ylabel('y');
axis([0 5 -1.5 1.5]);
legend("2 * sin(4 * pi * t)");


powerY = powerVector(y, Ta, T)
