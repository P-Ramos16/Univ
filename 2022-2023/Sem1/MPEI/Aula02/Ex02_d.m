N = 1e5;      %  num experiencias
n = 100;      %  lançamentos
mList = [200, 500, 1000, 2000, 5000, 10000, 20000, 50000, 100000];
ProbA = zeros(length(mList), 1);
                
             %  A: Um alvo ser atingido mais de uma vez            

for i= 1:length(mList)
    lancamentos   =  randi(mList(i), n, N); % é o mesmo disto: ceil(rand(n,N) * m);
    
    colIguais = zeros(1, N);  %  Alocar espaço
    
    for col=1:N
        colIguais(col) = length(unique(lancamentos(:,col))) < n;
                  % tamanho do vetor de numeros unicos é igual a n
    end
    
    ProbA(i) = sum(colIguais) / N;
end

plot(mList, ProbA)
title('Alinea 2d');
xlabel('num. Lançamentos');
ylabel('probabilidade');

ProbA