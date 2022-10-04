T = 0.01

% THICKER LINE?? how

hold on

% Alinea A
ta = 0:T:5;
ya = 2 * sin(4 * pi * ta);

plot(ta, ya, 'r');

title('Alinea A');
xlabel('x');
ylabel('y');


% Alinea B
tb = 0:T:5;
yb = cos(10 * pi * tb);

plot(tb, yb, 'b--');
p(2).LineWidth = 4;

title('Alinea B');
xlabel('x');
ylabel('y');


% Alinea C
tc = 0:T:5;
yc = ya.*yb;

plot(tc, yc, 'g--o');

title('Alinea C');
xlabel('x');
ylabel('y');


% Alinea D
td = 0:T:10;
yd = 3 * sin(pi * td) + 2 * sin(6 * pi * td);

plot(td, yd, 'y');
p(4).LineWidth = 2;

title('Alinea D');
xlabel('x');
ylabel('y');

hold off