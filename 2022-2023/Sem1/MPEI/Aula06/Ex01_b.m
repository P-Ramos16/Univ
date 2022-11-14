matEstados = [0.7 0.8 
              0.3 0.2];

sum(matEstados);
matEstados >= 0 & matEstados <= 1;

vetEstado1 = [0
              1];  % não estava presente no estado 1

vetEstado2 = matEstados * vetEstado1;
vetEstado3 = matEstados * vetEstado2;

resposta = vetEstado3(1)

% igual a vetEstado3 = (matEstados^2) * vetEstado1