import numpy as np
import matplotlib.pyplot as plt

# Tempo inicial e final
ti = 0
tf = 800

# Variáveis
m = 1
k = 1
b = 0.05
beta = 0.001
wf = 1.4
f0 = 7.5

# Posição inicial
xx0 = 2
# Velocidade inicial
vx0 = 4
# Aceleração inicial
ax0 = 0

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

# Soma das amplitudes máximas sao máximas (x[i-1] < x[i] > x[i-1])
amps = 0
# Array de tempos (o seu tamanho é o número de amplitudes máximas encontradas (para fazer a média))
nAmps = []
periodoArray = []

# Preencher os vetores
for i in range(n):  
    if (t[i] > 400):
        wf = 1.37  
        
    ax[i] = (-k * xx[i] * (1 + 2 * beta * xx[i]**2) - b * vx[i] + f0 * np.cos(wf * t[i])) / m
    vx[i + 1] = vx[i] + ax[i] * dt
    xx[i + 1] = xx[i] + vx[i + 1] * dt
    
    
    # Somar as amplitudes médias encontradas e incrementar o número destas encontradas
    #                                                 t > 550s para ser regime estacionário (mais ou menos)
    if (xx[i - 1] < xx[i]) and (xx[i] > xx[i + 1]) and (t[i] > 550):
        amps += xx[i]
        nAmps.append(t[i])
        
for i in range(1, len(nAmps)):
    periodoArray.append(nAmps[i] - nAmps[i-1])    
    
# Periodo = soma dos periodos / numero destes encontradas
periodo = sum(periodoArray) / len(periodoArray)        
# Amplitude = soma das amplitudes / numero destas encontradas
amplitude = amps / len(nAmps)
    

print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
print("┃                             ┃")
print("┃           Ex 2-c            ┃")
print("┃                             ┃")
print("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫")
print("┃  -Número de ciclos >        ┃")
print("┃     - %-8s              ┃" % len(nAmps))
print("┃  -Amplitude média (t>550) > ┃")
print("┃     - %-8s              ┃" % np.round(amplitude, 4))
print("┃  -Periodo >                 ┃")
print("┃     - %-8s              ┃" % np.round(periodo, 4))
print("┃                             ┃")
print("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")

# Plot
plt.plot(t, xx, label="x",  linestyle='-', linewidth=3, color="turquoise")
plt.xlabel("t (s)")
plt.ylabel("x (m)")
plt.legend()
plt.grid()
plt.show()
    
    