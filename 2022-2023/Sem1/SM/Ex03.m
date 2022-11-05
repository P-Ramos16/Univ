Ta = 0.001;


% Alinea A
t = 0:Ta:4;
T = 2;

y = 20 * sin(3*pi*t - 2*pi/3) + 16*sin(7*pi*t + 2*pi/3) + 10*sin(9*pi*t + pi/4);

p = plot(t, y, 'r');
p(1).LineWidth = 2;

title('Alinea A');
xlabel('x');
ylabel('y');
axis([0 4 -50 50]);
legend("2 * sin(4 * pi * t)");


powerY = powerVector(y, Ta, T)
