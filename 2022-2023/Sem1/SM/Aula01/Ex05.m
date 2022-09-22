x = linspace(-2, 2, 100);
y0 = sin(x);
y1 = cos(x);

subplot(2, 1, 1)
plot(x, y0, 'r.');

axis([-2 2 -1.5 1.5]);
title('Sin(x)');
legend('sin(x)');
xlabel('x');
ylabel('y');


subplot(2, 1, 2)
plot(x, y1, 'g-')

axis([-2 2 -1.5 1.5]);
title('Cos(x)');
legend('cos(x)');
xlabel('x');
ylabel('y');