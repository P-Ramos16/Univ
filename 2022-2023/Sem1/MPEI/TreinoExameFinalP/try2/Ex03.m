format long

T = [0.7  0.2  0    0    0    0
     0.2  0    0.3  0    0    0
     0    0.6  0.3  0    0    0
     0.1  0.2  0.3  0.1  0    0
     0    0    0.1  0.5  1    0
     0    0    0    0.4  0    1];

%estadoInicial = [0    1/2  0    1/2  0    0];
estadoInicial = 1;


% T = [Q    |    0
%      ------------
%      R    |    I]

%  Q(i,j)^n é a probabilidade de estar em i partindo de j após n passos

%  sum(Q(i,:)^n) é a probabilidade de estar em estados não absorventes
% partindo de i após n passos

%  sum(F(i,j)) é o número médio de vezes que se passa por j até à absorção
% partindo de i

%  sum(F(i,:)) é o número médio de transições até à absorção
% partindo de i

%  B(i,j) é a probabilidade de absorção pelo estado absorvente i partindo de j (sum = 1)

nena = 4; % Numero de estados nao absorventes
Q = T(1:nena, 1:nena);
R = T(nena+1:end, 1:nena);
% F = (I-Q)⁻1
F = inv(eye(nena) - Q);
B = R*F;

%% estar em i partindo de j em n passos
res = Q^10;
res(3, 1)
res = Q^15;
res(4, 1)

%% iteraçoes médias até absorção começando em i
sum(F(:,3))
%B(1, 3) prob absorção por estado absorvente 1 (5) partindo de 3
%B(2, 3)