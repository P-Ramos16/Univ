matEstados = [1/3  1/4   0
              1/3 11/20 1/2
              1/3  1/5  1/2];

format rat; % mostar os outputs como frações

nAlunos = 90;

vetEstado1 = [1/3 1/3 1/3]'

vetEstadosFinal = (matEstados^30) * vetEstado1

A  = vetEstadosFinal(1) * nAlunos
B  = vetEstadosFinal(2) * nAlunos
C  = vetEstadosFinal(3) * nAlunos

% IGUAL À ALINEA C pois após algumas iterações
% estabiliza num estado estacionário