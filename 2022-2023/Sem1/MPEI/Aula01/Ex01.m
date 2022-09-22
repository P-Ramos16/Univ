N = 6 %% Num experiencias

%% Simula em matlab o resultado de 3 moedas (0 = croa | 1 = cara)

M = rand(3, N) %% Matriz random 3xNum.Experiencias

lancamentos = M > 0.5 %% Sort só às caras

%% Casos favoráveis (com  2 caras)

num_caras = sum(lancamentos) %% Matriz 1xNum:experiencias com quantas vezes saio cara

x = num_caras == 2 %% Matriz 1xNum.Experiencias de zeros e uns caso num_caras seja 2 ou nao
cfav = sum(x) %% Num de vezes que saio 2 caras em 3 lançamentos

prob = cfav / N %% Probabilidade final