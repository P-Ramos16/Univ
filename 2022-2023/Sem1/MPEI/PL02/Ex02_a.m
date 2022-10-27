N = 1e5;      %  num experiencias
n = 20;       %  lançamentos
m = 100;      %  num alvos
                
             %  A: Nenhum alvo ser atingido mais de uma vez            

lancamentos   =  randi(m, n, N); % é o mesmo disto: ceil(rand(n,N) * m);

colDiferentes = zeros(1, N);  %  Alocar espaço

for col=1:N
    colDiferentes(col) = length(unique(lancamentos(:,col))) == n;
              % tamanho do vetor de numeros unicos é igual a n
end

ProbA = sum(colDiferentes) / N