clear all;
load("Guitar03.mat")

Ta = 1/fa
t = (0:length(x)-1)'/Ta;

Delay = 1;
Gain = 0.4;

y = reverb(x, fa, Delay, Gain);

subplot(2,1,1);
plot(t, x);
grid on;

subplot(2,1,2);
plot(t, y);
grid on;