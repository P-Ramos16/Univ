x = linspace(-8, 0, 100);
y = sin(x) .* exp(x);

plot(x, y, 'r.');
axis([-8 0 -0.5 0.8]);
title('Sin(x) * e^x');
legend('sin(x)*e^x');
xlabel('x');
ylabel('y');