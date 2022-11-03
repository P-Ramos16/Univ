%???

Ta = 1 / 25
x1 = -5:Ta:5;
x2 = -5:Ta:5;
t = 0:Ta:5;

hold on

t = @(time) 2 * sin(2* pi * sqrt(xi1.^2 + xi2.^2) - 2*pi*time);

for time = 0:1:5
    plot3(5, 5, t(time), 'm.');
end

hold off
title('Alinea E');
xlabel('x');
ylabel('y');