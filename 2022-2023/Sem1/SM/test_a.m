Ta = 0.001

% Alinea A
xa = 0:Ta:5;
ya =  20 * sin(3*pi*xa - 2*pi/3) + 16*sin(7*pi*xa + 2*pi/3) + 10*sin(9*pi*xa - pi/4);

plot(xa, ya, 'r.');

axis([0 5 -50 50]);
title('Alinea A');
xlabel('x');
ylabel('y');

