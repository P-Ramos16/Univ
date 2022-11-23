   % Oceano Deserto Floresta Urbano
T = [0.1    0.2    0.25    0.25
     0.3    0.4    0.25    0.25
     0.3    0.2    0.25    0.25
     0.3    0.2    0.25    0.25];

Q = T;

n = 7;

Q7 = Q^n;

ProbComO = Q7(1,3);
ProbComD = Q7(2,3);
ProbComF = Q7(3,3);
ProbComU = Q7(4,3);

ProbFinal = 0.25*ProbComO + 0.25*ProbComD + 0.25*ProbComF + 0.25*ProbComU