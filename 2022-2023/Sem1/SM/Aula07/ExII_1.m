Ta = 0.01;      % sampling period

T = 1;

t = 0:Ta:T;

x = sin(2*pi*t);

delta = 1/(2^3)

partition = [-1:delta:1.25];
codebook = [-1-delta:delta:1.25];
[index,y] = quantiz(x,partition,codebook);

hold on
figure(1);
plot(t, x, '-');
legend("Sinal original");
plot(t, y, '.');
legend("Sinal original");
title('Ex02_a');
xlabel('x');
ylabel('y');
axis([0 1 -1.25 1.25]);
grid on;
hold off;