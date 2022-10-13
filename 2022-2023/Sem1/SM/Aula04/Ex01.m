Ta = 0.001;
f0 = 1;
Np = 2;


bk = [0 4/pi 0 4/(3*pi) 0 4/(5*pi) 0 4/(7*pi) 0 4/(9*pi) 0 4/(11*pi)];

ak = zeros(size(bk));


[f, t] = fourier(Ta, f0, Np, ak, bk);

hold on
plot(t, f, 'b');



% figure(6);
% t1 = 0:0.01:2;
% y = square(2*pi*1*t1);
% 
% plot(t1, y, 'b');

title('Ex01');
xlabel('x');
ylabel('f');
%axis([0 2 -1.5 1.5]);
legend("f");
hold off


