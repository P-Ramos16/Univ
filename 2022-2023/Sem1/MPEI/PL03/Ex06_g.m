T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1];

estadoInicial = 1;


% T = [Q    |    0
%      ------------
%      R    |    I]

%  Q(ij)^n é a probabilidade de estar em j partindo de i após n passos

%  sum(Q(i:)^n) é a probabilidade de estar em estados não absorventes
% partindo de i após n passos

%  sum(F(i,j)) é o número médio de vezes que se passa por j até à absorção
% partindo de i

%  sum(F(i,:)) é o número médio de transições até à absorção
% partindo de i

%  B(i,j) é a probabilidade de absorção pelo estado j partindo de i (sum = 1)

nena = 3; % Numero de estados nao absorventes

Q = T(1:nena, 1:nena);

R = T(nena+1:end, 1:nena)

% F = (I-Q)⁻1
F = inv(eye(nena) - Q);

B = R*F

absorcaoEstado3 = B(1, estadoInicial)
absorcaoEstado5 = B(2, estadoInicial)

% São os mesmos valores verificados na alínea 6.c após algumas iterações