clear all
close all
clc

%%
N1 = 128;
N2 = 128;
n1 = (0:N1-1);
n2 = (0:N2-1)';

%%
x = sin(2*pi*0.2*(1*n1+1*n2));
X = fft2(x);

%%
figure(1);
imshow(abs(X),[]);
figure(2);
surf(n1, n2, abs(X));