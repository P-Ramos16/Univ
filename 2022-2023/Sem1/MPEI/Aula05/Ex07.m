lambda = 15;

k = 0;
PkA = ((lambda)^k / factorial(k)) * exp(-lambda)


PkB = 0;
% Temos de fazer os casos contrários, visto que existem infinitos casos 
% sucesso (pode receber 15, 20, 10000, 435821 mensagens, mas só nao pode
% entre 0 e 10)
for k1 = 0:1:10
    PkB = PkB + ((lambda)^k1 / factorial(k1)) * exp(-lambda);
end
% Transformar a probabilidade de casos contrários 
% para a probabilidade de casos sucesso
PkB = 1- PkB