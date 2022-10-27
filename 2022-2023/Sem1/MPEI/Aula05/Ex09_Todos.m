N = 1e7;      %  num experiencias
media = 14;
dp = 2;       %  Desvio Padrão

arrayX   =  randn(1, N);


arrayY = arrayX * dp + media;
hist(arrayY, 100)
ax=axis();
% mesmos eixos que o outro subplot

ProbA = sum(arrayY>=12 & arrayY<=16) / N
ProbB = sum(arrayY>=10 & arrayY<=18) / N
ProbC = sum(arrayY>=10) / N


      % Prob de ter até 16 - Prob de ter até 12
ProbD = normcdf(16, 14, 2) - normcdf(12, 14, 2)