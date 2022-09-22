x = linspace(-2, 2, 100);
y0 = sin(x);
y1 = cos(x);


plot(x, y0, 'r.');
hold on
plot(x, y1, 'g--')
hold off

axis([-2 2 -1.5 1.5]);
title('Sin(x) * e^x');
legend('sin(x)*e^x');
xlabel('x');
ylabel('y');