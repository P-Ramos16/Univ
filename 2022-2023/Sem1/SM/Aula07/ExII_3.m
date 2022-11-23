Ta = 0.01;      % sampling period

T = 1;

t = 0:Ta:T;

x = sin(2*pi*t);

partition = [-1:0.25:1.25];
codebook = [-1.25:0.25:1.25];
[index,y] = quantiz(x,partition,codebook);

[X, f] = espetro(y, Ta);

[Y, t] = reconstroi(X, f);


hold on
figure(1);
plot(t, Y, '.');
legend("Sinal original");
title('Ex02_a');
xlabel('x');
ylabel('y');
axis([0 1 -1 1]);
grid on;
hold off;