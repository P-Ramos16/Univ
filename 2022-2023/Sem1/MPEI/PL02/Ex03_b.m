N = 1e5;      %  num experiencias
n = 10;       %  num keys 
m = 100:100:1000;     %  tamanho do array
res = [];
ProbA = zeros(1, length(m));
i = 1;

for tamanho = m
    array   =  randi(tamanho, n, N); % é o mesmo disto: ceil(rand(n,N) * m);
             % array de tamanho 10 com numeros de 1 a 1000 (posições)
    colIguais = zeros(1, N);  %  Alocar espaço
    
    for col=1:N
        colIguais(col) = length(unique(array(:,col))) < n;
                  % tamanho do vetor de numeros unicos é menor a n
    end
    
    ProbA(i) = sum(colIguais) / N;
    i = i + 1;
end


plot(m, ProbA);
axis([0 1100 0 1]);
title('Alinea 3b');
xlabel('tamanho do array');
ylabel('probabilidade de colisão');
