Ta = 0.01;

t = 0:Ta:5;


hold on 

subplot(3, 1, 1)
phi = rand(1, 3) * 2 * pi - pi;
% rand entre ]-pi, pi[

y = sin(2*pi*10*t + phi(1)) + sin(2*pi*20*t + phi(2)) + sin(2*pi*30*t + phi(3));

plot(t, y, 'r')

powerVector(y, Ta, 1)

subplot(3, 1, 2)
phi = rand(1, 3) * 2 * pi - pi;
% rand entre ]-pi, pi[

y = sin(2*pi*10*t + phi(1)) + sin(2*pi*20*t + phi(2)) + sin(2*pi*30*t + phi(3));

plot(t, y, 'g')

powerVector(y, Ta, 1)

subplot(3, 1, 3)
phi = rand(1, 3) * 2 * pi - pi;
% rand entre ]-pi, pi[

y = sin(2*pi*10*t + phi(1)) + sin(2*pi*20*t + phi(2)) + sin(2*pi*30*t + phi(3));

plot(t, y, 'b')

powerVector(y, Ta, 1)


hold off