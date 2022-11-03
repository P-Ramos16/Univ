T= 0.1;

A= [1 2 0.5];
F= [2 4 10];

phi=[0 pi/2 pi/4];
t=0:T:1;
x=zeros(1,length(t));

for k=1:3
    x=x+A(k)*cos(2*pi*F(k)*t+phi(k));
end

plot(t,x)
xlabel("t seg.")
grid on 