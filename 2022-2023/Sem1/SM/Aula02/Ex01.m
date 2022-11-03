Ta = 0.01

% Alinea A
xa = 0:Ta:5;
ya = 2 * sin(4 * pi * xa);

subplot(4, 1, 1)
plot(xa, ya, 'r.');

axis([0 5 -2.5 2.5]);
title('Alinea A');
xlabel('x');
ylabel('y');


% Alinea B
xb = 0:Ta:5;
yb = cos(10 * pi * xb);

subplot(4, 1, 2)
plot(xb, yb, 'y.');

axis([0 5 -2.5 2.5]);
title('Alinea B');
xlabel('x');
ylabel('y');


% Alinea C
xc = 0:Ta:5;
yc = ya.*yb;

subplot(4, 1, 3)
plot(xc, yc, 'g.');

axis([0 5 -2.5 2.5]);
title('Alinea C');
xlabel('x');
ylabel('y');


% Alinea D
xd = 0:Ta:10;
yd = 3 * sin(pi * xd) + 2 * sin(6 * pi * xd);

subplot(4, 1, 4)
plot(xd, yd, 'b.');

axis([0 10 -5 5]);
title('Alinea D');
xlabel('x');
ylabel('y');

% Alinea E
figure;
xe0 = 0:Ta:5;
xe1 = 0:Ta:5;
ye = 2 * sin(2 * pi * (2 * xe0 + xe1));

plot3(xe0, xe1, ye, 'm.');

title('Alinea E');
xlabel('x');
ylabel('y');