load('Guitar03.mat')

Ta = 1/fa;

[X, f] = espetro(x, Ta);

Hf0 = zeros(1, length(X));
Hf1 = zeros(1, length(X));
Hf2 = zeros(1, length(X));
Hf0(f>100&f<400) = 1;
Hf0(f>-400&f<-100) = 1;
Hf1(f>400&f<600) = 1;
Hf1(f>-600&f<-400) = 1;
Hf2(f>600&f<1200) = 1;
Hf2(f>-1200&f<-600) = 1;

xFiltered = X.*Hf0';

figure(1);
title('Ex02');
xlabel('f (Hz)');
ylabel('X');
plot(f, abs(xFiltered));
axis([-1000 1000 0 6e-3]);
grid on;


[xReconst, t] = reconstroi(xFiltered, f); % xFiltered

sound(xReconst, fa)

figure(1);
plot(t, xReconst);
axis([0 6 -0.2 0.2]);
grid on;



figure(2);
title('Ex02');
xlabel('f (Hz)');
ylabel('X');
axis([-4000 4000 0 1.25]);
grid on;
hold on

plot(f, abs(Hf0), 'r');
legend("Hf0");
plot(f, abs(Hf1), 'b');
legend("Hf1");
plot(f, abs(Hf2), 'g');
legend("Hf2");

hold off