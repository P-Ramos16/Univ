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

%  Q(i,j)^n é a probabilidade de estar em j partindo de i após n passos

%  sum(Q(i,:)^n) é a probabilidade de estar em estados não absorventes
% partindo de i após n passos

%  sum(F(i,j)) é o número médio de vezes que se passa por j até à absorção
% partindo de i

%  sum(F(i,:)) é o número médio de transições até à absorção
% partindo de i

%  B(i,j) é a probabilidade de absorção pelo estado j partindo de i (sum = 1)

nena = 4; % Numero de estados nao absorventes
Q = T(1:nena, 1:nena);
R = T(nena+1:end, 1:nena);
% F = (I-Q)⁻1
F = inv(eye(nena) - Q);
B = R*F;

(1 - sum(Q(:, 1).^5)) * B(1, 1)
                   %  Probablidade de estar num estado absorvente após 5 meses
                   % partindo de 1 * prob de ser absorvido por estado 5 (primeiro estado absorvente)
(1 - sum(Q(:, 3).^50)) * B(2, 1)
                   %  Probablidade de estar num estado absorvente após 50 meses
                   % partindo de 3 * prob de ser absorvido por estado 6 (segundo estado absorvente)