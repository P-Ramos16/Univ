N = 1e5;      %  num experiencias
n = 20;       %  lançamentos
m = 100;      %  num alvos
                
             %  A: Um alvo ser atingido mais de uma vez            

lancamentos   =  randi(m, n, N); % é o mesmo disto: ceil(rand(n,N) * m);

colIguais = zeros(1, N);  %  Alocar espaço

for col=1:N
    colIguais(col) = length(unique(lancamentos(:,col))) < n;
              % tamanho do vetor de numeros unicos é menor a n
end

ProbA = sum(colIguais) / N