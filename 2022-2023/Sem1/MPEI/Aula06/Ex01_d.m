nAulas = 1:1:30

matEstados = [0.7 0.8 
              0.3 0.2];

sum(matEstados);
matEstados >= 0 & matEstados <= 1;

vetEstado1 = [0.15  % prob estar presente na primeira aula
              0.85];

vetEstadoFinal = zeros(1, 30);

vetEstadoFinal(1) = vetEstado1(1)

for i = 1:1:29
    vetEstado = (matEstados^i) * vetEstado1;
    vetEstadoFinal(i+1) = vetEstado(2);
end

plot(nAulas, vetEstadoFinal)
axis([0 31 0.1 0.3])
grid on