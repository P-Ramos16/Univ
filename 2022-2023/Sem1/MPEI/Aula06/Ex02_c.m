matEstados = [1/3  1/4   0
              1/3 11/20 1/2
              1/3  1/5  1/2];

format rat; % mostar os outputs como frações

nAlunos = 90;

vetEstado1 = [60 15 15]' / nAlunos;

vetEstadosFinal = (matEstados^30) * vetEstado1

GrupoA  = vetEstadosFinal(1) * nAlunos
GrupoB  = vetEstadosFinal(2) * nAlunos
GrupoC  = vetEstadosFinal(3) * nAlunos
