N = 1e5;     %  num de experiencias
n = 2;       %  lançamentos
p = 0.5;     %  probabilidade de um filho rapaz
k = 2;       %  num. minimo pretendido de filho rapaz
                
             %  A: O primeiro filho é rapaz
             %  B: O segundo filho é rapaz

             %  P(B|A) = P(B e A) / P(A)
            

lancamentos   =  rand(n,N) > (1-p);
prob1Rapaz    =  lancamentos(1,:) == 1;     %  P(A)
prob2Rapazes  =  sum(lancamentos) == 2;     %  P(B e A)

probSimulacao =  (sum(prob2Rapazes) / sum(prob1Rapaz))  %  P(B|A)


% P(B|A) = P(B), logo A e B são eventos independentes
% Como são independentes, P(B e A) = P(A) * P(B),logo
% P(B|A) = P(B)*P(A)/P(A) (=) P(B|A) = P(B)
