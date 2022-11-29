clear all;
load("Guitar03.mat")

Ta = 1/fa
t = (0:length(x)-1)'/Ta;

MaxDelay = 0.3;
NumComp = 15;

y = chorus(x, fa, MaxDelay, NumComp);

subplot(2,1,1);
plot(t, x);
grid on;

subplot(2,1,2);
plot(t, y);
grid on;