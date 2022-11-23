matEstados = [0.7 0.8 
              0.3 0.2];

sum(matEstados);
matEstados >= 0 & matEstados <= 1;

vetEstado1 = [1  % estava presente no estado 1
              0];

vetEstadoFinal = (matEstados^29) * vetEstado1;

resposta = vetEstadoFinal(1)
