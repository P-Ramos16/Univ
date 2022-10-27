N = 1e5;     %  num de experiencias
n = 5;       %  lançamentos
p = 0.5;     %  probabilidade de um filho rapaz
                
             %  A: Pelo menis um filho é rapaz
             %  B: Só mais um filho é rapaz

             %  P(B|A) = P(B e A) / P(A)
            
tic

lancamentos   =  rand(n,N) > (1-p);
ProbA    =  sum(lancamentos) >= 1;     %  P(A)      SE REFIZERMOS COMO
                                       % 1-(ProbNaoA) É MAIS EFICIENTE
ProbAeB  =  sum(lancamentos) >= 2;     %  P(B e A)

probSimulacao =  (sum(ProbAeB) / sum(ProbA))  %  P(B|A)

toc



