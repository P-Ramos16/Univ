format long

T = [0.7  0.1  0    0    0    0
     0.2  0    0    0.3  0    0
     0.1  0.3  0.1  0.4  0    0
     0    0.6  0    0.1  0    0
     0    0    0.4  0.2  1    0
     0    0    0.5  0    0    1];

%estadoInicial = [0    1/2  0    1/2  0    0];
estadoInicial = 1;


% T = [Q    |    0
%      ------------
%      R    |    I]

%  Q(i,j)^n é a probabilidade de estar em i partindo de j após n passos

%  sum(Q(:,j)^n) é a probabilidade de estar em estados não absorventes
% partindo de j após n passos

%  sum(F(i,j)) é o número médio de vezes que se passa por i até à absorção
% partindo de j

%  sum(F(:,j)) é o número médio de transições até à absorção
% partindo de j

%  B(i,j) é a probabilidade de absorção pelo estado i partindo de j (sum = 1)

nena = 4; % Numero de estados nao absorventes

Q = T(1:nena, 1:nena);

R = T(nena+1:end, 1:nena);

% F = (I-Q)⁻1
F = inv(eye(nena) - Q);

B = R*F;

sum(B(:,1))
sum(F(:,1))


absorcaoEstado3 = B(1, estadoInicial)
absorcaoEstado5 = B(2, estadoInicial)