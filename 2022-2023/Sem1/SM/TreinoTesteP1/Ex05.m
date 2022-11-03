clear all

hold on

F= 20000;
t= 0:1/F:0.1;
x1= cos(2*pi*300*t);
x2= cos(2*pi*2300*t + pi/2);
plot(t,x1)
plot(t,x2)
axis([0 4/300 -1 1])
grid on

hold off