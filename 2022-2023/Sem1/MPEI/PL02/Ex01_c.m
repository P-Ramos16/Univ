N = 1e5;     %  num de experiencias
n = 2;       %  lançamentos
p = 0.5;     %  probabilidade de um filho rapaz
k = 2;       %  num. minimo pretendido de filho rapaz
                
             %  A: Um filho é rapaz
             %  B: O outro filho é rapaz

             %  P(B|A) = P(B e A) / P(A)
            

lancamentos   =  rand(n,N) > (1-p);
prob1Rapaz    =  sum(lancamentos) >= 1;     %  P(A)
prob2Rapazes  =  sum(lancamentos) == 2;     %  P(B e A)

probSimulacao =  (sum(prob2Rapazes) / sum(prob1Rapaz))  %  P(B|A)


% Casos possiveis: (MF, FM, MM, FF) <-- FF nao existe  por causa da 
% condição de pelo menos um ser M, logo só exitem 3 casos possiveis

% O unico caso de sucesso é MM logo a probabilidade é 1/3 = 0.333...


