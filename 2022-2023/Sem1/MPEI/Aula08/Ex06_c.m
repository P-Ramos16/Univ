%%
n = 100;

T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1]


V = [1   0   0   0   0]';

probFinalA = zeros(1, n);
probFinalB = zeros(1, n);

%%
estadoFinal = 4;
probFinalA(1) = V(estadoFinal);

for i = 1:1:n-1
    probEstado = (T^i) * V;
    probFinalA(i+1) = probEstado(estadoFinal);
end


estadoFinal = 5;
probFinalB(1) = V(estadoFinal);

for i = 1:1:n-1
    probEstado = (T^i) * V;
    probFinalB(i+1) = probEstado(estadoFinal);
end

%%
hold on;
plot(1:1:n, probFinalA);
plot(1:1:n, probFinalB);
grid on;
hold off;