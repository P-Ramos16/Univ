%???

T = 1 / 25
x1 = linspace(-5, 5);
x2 = linspace(-5, 5);
y = 2 * sin(2* pi * sqrt(x1.^2 + x2.^2));

plot(x1, y, 'm.');

title('Alinea E');
xlabel('x');
ylabel('y');