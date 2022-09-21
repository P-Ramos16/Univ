import numpy as np
import matplotlib.pyplot as plt

# Tempo inicial e final
ti = 0
tf = 100

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
xx = np.empty(n + 1)
vx = np.empty(n + 1)
ax = np.empty(n + 1)

# Introduzir x0 e v0 nos vetores da posição e velocidade
xx[0] = xx0
vx[0] = vx0
ax[0] = ax0

# Soma das amplitudes máximas (x[i-1] < x[i] > x[i-1])
amps = 0
# Array de tempos (o seu tamanho é o número de amplitudes máximas encontradas (para fazer a média))
tAmps = []
periodoArray = []

# Preencher os vetores
for i in range(n):    
    ax[i] = (-k * xx[i] - 3 * alpha * xx[i]**2 + 4 * beta * xx[i]**3) / m
    vx[i + 1] = vx[i] + ax[i] * dt
    xx[i + 1] = xx[i] + vx[i + 1] * dt
    
    # Somar as amplitudes médias encontradas e adicionar o t destas no array
    if (xx[i - 1] < xx[i]) and (xx[i] > xx[i + 1]):
        amps += xx[i]
        tAmps.append(t[i])

    
# Array de periodos
for i in range(1, len(tAmps)):
    periodoArray.append(tAmps[i] - tAmps[i-1])    
    
# Periodo = soma dos periodos / numero destes encontradas
periodo = sum(periodoArray) / len(periodoArray)        
# Amplitude = soma das amplitudes / numero destas encontradas
amplitude = amps / len(tAmps)
    

print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
print("┃                             ┃")
print("┃           Ex 1-c            ┃")
print("┃                             ┃")
print("┣━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┫")
print("┃  -Número de ciclos >        ┃")
print("┃     - %-8s              ┃" % len(tAmps))
print("┃                             ┃")
print("┃  -Amplitude média >         ┃")
print("┃     - %-8s              ┃" % np.round(amplitude, 4))
print("┃  -Amplitude Maxima >        ┃")
print("┃     - %-8s              ┃" % np.round(np.max(xx), 4))
print("┃  -Amplitude Minima >        ┃")
print("┃     - %-8s              ┃" % np.round(np.min(xx), 4))
print("┃                             ┃")
print("┃  -Periodo Médio >           ┃")
print("┃     - %-8s              ┃" % np.round(periodo, 4))
print("┃  -Periodo Maximo >          ┃")
print("┃     - %-8s              ┃" % np.round(np.max(periodoArray), 4))
print("┃  -Periodo Minimo>           ┃")
print("┃     - %-8s              ┃" % np.round(np.min(periodoArray), 4))
print("┃                             ┃")
print("┃  -Frequència Média>         ┃")
print("┃     - %-8s              ┃" % np.round(1 / periodo, 4))
print("┃  -Frequència Maxima >       ┃")
print("┃     - %-8s              ┃" % np.round(1 / np.min(periodoArray), 4))
print("┃  -Frequència Minima >       ┃")
print("┃     - %-8s              ┃" % np.round(1 / np.max(periodoArray), 4))
print("┃                             ┃")
print("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")

# Plot
plt.plot(t, xx, label="x",  linestyle='-', linewidth=3, color="turquoise")
plt.xlabel("t (s)")
plt.ylabel("x (t)")
plt.legend()     
plt.grid()
plt.show()
    