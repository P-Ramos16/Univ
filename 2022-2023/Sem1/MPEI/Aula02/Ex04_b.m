N = 1e3;      %  num experiencias
n = 1:1:100;       %  num keys 
m = 365;     %  tamanho do array
res = [];

ProbA = zeros(1, length(m));
i = 1;

for nPessoas = n
    array   =  randi(m, nPessoas, N); % é o mesmo disto: ceil(rand(n,N) * m);
             % array de tamanho 10 com numeros de 1 a 1000 (posições)
    colIguais = zeros(1, N);  %  Alocar espaço
    
    for col=1:N
        colIguais(col) = length(unique(array(:,col))) < nPessoas;
                  % tamanho do vetor de numeros unicos é menor a n
    end
    
    ProbA(i) = sum(colIguais) / N;
    i = i + 1;
end


plot(n, ProbA);
axis([0 100 0 1]);
title('Alinea 3c');
xlabel('tamanho do array');
ylabel('probabilidade de colisão');

%  Com 40 pessoas já existe uma probabilidade maior do que 0.9 de haver
%  aniversários coincidentes
