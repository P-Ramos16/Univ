T= 0.001;

A= [1 2 0.5];
F= [2 4 10];

phi=[0 pi/2 pi/4];
t=0:T:1;
x=zeros(1,length(t));

for k=1:3
    x=x+A(k)*cos(2*pi*F(k)*t+phi(k));
end

subplot(2, 1, 1);
plot(t,x)
xlabel("t seg.")
grid on 

[X, f] = espetro(x, T);

subplot(2, 1, 2);
p = plot(f, abs(X), 'b');
p(1).LineWidth = 1;
axis([-12 12 0 2.5])
legend("f");
title('Ex02_i');
xlabel('f (Hz)');
ylabel('X');
grid on;