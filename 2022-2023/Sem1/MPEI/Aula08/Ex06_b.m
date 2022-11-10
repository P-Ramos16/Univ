%%
n = 100;

T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1]


probFinal = zeros(1, n);

%%
V = [1   0   0   0   0]';
probFinal(1) = V(2);

for i = 1:1:n-1
    probEstado = (T^i) * V;
    probFinal(i+1) = probEstado(2);
end

%%
plot(1:1:n, probFinal);
grid on;