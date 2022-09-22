x = linspace(0, 2*pi, 200);
y = sin(2*x);
plot(x, y, 'm--');
axis([0 6 -1.25 1.25])
title('Função sin')
xlabel('x')
ylabel('y')
legend('sin')