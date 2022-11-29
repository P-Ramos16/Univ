clear all
load('Guitar02.mat');

fa = 1/Ta;

x_new = x(1:500);

T = length(x_new)*Ta
t = 0:Ta:T;

x = sin(2*pi*t);

num_bits = 4;
delta = 1/(2^num_bits);

partition = [-1:delta:1];
codebook = [-1-delta:delta:1];
[index,y] = quantiz(x,partition,codebook);

[X, f] = espetro(y, Ta);

[Y, t] = reconstroi(X, f);


hold on
figure(1);
plot(t, Y, '.');
legend("Sinal original");
title('Ex02_a');
xlabel('x_new');
ylabel('y');
axis([0 T -0.5 0.5]);
grid on;
hold off;