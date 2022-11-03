hold on

F= 2000;
t= 0:1/F:02-1/F;
x= 2*cos(2*pi*100*t) + cos(2*pi*60*t+pi/5);
figure(1)
plot(t,x)
axis([0 0.1 -3 3])
grid on

hold off