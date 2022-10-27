Sx = 1:6

probs = [1 1 1 1 1 1]/6

% Função Massa de Probabilidade

stem(Sx, probs)

title("fmp de X")
xlabel("x_i")
ylabel("P[X=x_i]")
axis([-0.1 6.1 0 0.5])

pacumu1 = cumsum(probs)

stairs(Sx, pacumu1)