import numpy as np
import matplotlib.pyplot as plt

# Tempo inicial e final
ti = 0
tf = 10

# Variáveis
m = 0.5
k = 2
alpha = -0.1
beta = 0.02
xxEqui = 0

# Posição inicial
xx0 = 1.5
# Velocidade inicial
vx0 = 0.5
# Aceleração inicial
ax0 = 0

# dt incremento do tempo e n numero de intervalos
dt = 0.001
n = int((tf - ti) / dt)

# Vetor tempo (n+1 para garantir que nao falta o ultimo dado (Ex: t[10]))
t = np.linspace(ti, tf, n + 1)

# Vetor velocidade (empty e não zeros para não alterar 
# muito o resultado se faltar analisar um dado)
Emec = np.empty(n + 1)
xx = np.empty(n + 1)
vx = np.empty(n + 1)
ax = np.empty(n + 1)

# Introduzir x0 e v0 nos vetores da posição e velocidade
xx[0] = xx0
vx[0] = vx0
ax[0] = ax0

# Preencher os vetores
for i in range(n):    
    ax[i] = (-k * xx[i] - 3 * alpha * xx[i]**2 + 4 * beta * xx[i]**3) / m
    vx[i + 1] = vx[i] + ax[i] * dt
    xx[i + 1] = xx[i] + vx[i + 1] * dt
    
    Emec[i] = 0.5 * m * vx[i]**2 + 0.5 * k  * xx[i]**2 + alpha * xx[i]**3 - beta * xx[i]**4  
    
Emec[-1] = 0.5 * m * vx[-1]**2 + 0.5 * k  * xx[-1]**2 + alpha * xx[-1]**3 - beta * xx[-1]**4
      
print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
print("┃                             ┃")
print("┃           Ex 1-b            ┃")
print("┃                             ┃")
print("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫")
print("┃  -Emec >                    ┃")
print("┃     - %-8s              ┃" % np.round(np.sum(Emec) / len(Emec), 4))
print("┃  -Emec maxima >             ┃")
print("┃     - %-8s              ┃" % np.round(np.max(Emec), 4))
print("┃  -Emec minima >             ┃")
print("┃     - %-8s              ┃" % np.round(np.min(Emec), 4))
print("┃                             ┃")
print("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")

# Plot
plt.plot(t, xx, label="x",  linestyle='-', linewidth=3, color="turquoise")
plt.xlabel("t (s)")
plt.ylabel("x (t)")
plt.legend()         # Legenda só aparece com isto
plt.grid()
plt.show()