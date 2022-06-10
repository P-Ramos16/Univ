import numpy as np
import matplotlib.pyplot as plt


# Tempo inicial e final
ti = 0
tf = 10

# Massa
m = 1
k = 1
b = 0.05
f0 = 7.5
wf = 1

# Posição inicial
xx0 = 4

# Aceleração inicial
ax0 = 0

# Velocidade inicial
vx0 = 0

# dt incremento do tempo e n numero de intervalos
dt = 0.001
n = int((tf - ti) / dt)


# Vetor tempo (n+1 para garantir que nao falta o ultimo dado (Ex: t[10]))
t = np.linspace(ti, tf, n + 1)

# Vetor velocidade (empty e não zeros para não alterar 
# muito o resultado se faltar analisar um dado)
xx = np.empty(n + 1)
vx = np.empty(n + 1)
ax = np.empty(n + 1)

# Introduzir x0 e v0 nos vetores da posição e velocidade
xx[0] = xx0
vx[0] = vx0
ax[0] = ax0


# Preencher os vetores x, v, a
for i in range(n):
    ax[i] = (-k * xx[i] - b * vx[i] * xx[i] + f0 * np.cos(wf * t)) / m
    vx[i + 1] = vx[i] + ax[i] * dt
    xx[i + 1] = xx[i] + vx[i + 1] * dt
    


# Plot
plt.plot(t, xx, label="x",  linestyle='-', linewidth=3, color="turquoise")
plt.xlabel("x (t)")
plt.ylabel("t (s)")
plt.legend()         # Legenda só aparece com isto
plt.grid()

    
    