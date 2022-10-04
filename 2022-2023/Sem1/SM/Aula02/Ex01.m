% Alinea A
ta = 0:0.01:5;
ya = 2 * sin(4 * pi * ta);

subplot(4, 1, 1)
plot(ta, ya, 'r.');

axis([0 6 -2.5 2.5]);
title('Alinea A');
xlabel('x');
ylabel('y');


% Alinea B
tb = 0:0.01:5;
yb = cos(10 * pi * tb);

subplot(4, 1, 2)
plot(tb, yb, 'y.');

axis([0 6 -2.5 2.5]);
title('Alinea B');
xlabel('x');
ylabel('y');


% Alinea C
tc = 0:0.01:5;
yc = ya.*yb;

subplot(4, 1, 3)
plot(tc, yc, 'g.');

axis([0 6 -2.5 2.5]);
title('Alinea C');
xlabel('x');
ylabel('y');


% Alinea D
td = 0:0.01:10;
yd = 3 * sin(pi * td) + 2 * sin(6 * pi * td);

subplot(4, 1, 4)
plot(td, yd, 'b.');

axis([0 10 -5 5]);
title('Alinea D');
xlabel('x');
ylabel('y');

% Alinea E
figure;
te0 = 0:0.01:5;
te1 = 0:0.01:5;
ye = 2 * sin(2* pi * (2 * te0 + te1));

plot3(te0, te1, ye, 'm.');

title('Alinea E');
xlabel('x');
ylabel('y');