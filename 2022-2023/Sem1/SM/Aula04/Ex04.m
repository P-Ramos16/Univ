Ta = 0.001;
f0 = 1;
Np = 4
K = 14
N = round(Np/(f0*Ta))
t = [0: (N-1)]'*Ta;
T0 = 1 / f0;

f = sawtooth(2*pi*f0*t + pi/2, 1/2)'

[ak1, bk1] = coefs(Ta, T0, f, K)
[fRemake, t] = fourier(Ta, f0, Np, ak1, bk1);

hold on
p = plot(t, f, 'b');
p(1).LineWidth = 4;
legend("f");
title('Ex01');
xlabel('x');
ylabel('f');
axis([0 4 -1.25 1.25]);
grid on;

p = plot(t, fRemake, 'r');
p(1).LineWidth = 2;
hold off