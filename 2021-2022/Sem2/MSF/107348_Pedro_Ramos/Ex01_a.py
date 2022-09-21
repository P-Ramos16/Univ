import numpy as np
import matplotlib.pyplot as plt

# Variáveis
m = 0.5
k = 2
alpha = -0.1
beta = 0.02
xxEqui = 0

# Vetores
xx = np.linspace(-3, 3)
Epot = np.empty(len(xx))

# Preencher os vetores
Epot = 0.5 * k * xx**2 + alpha * xx**3 - beta * xx**4    

print("┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓")
print("┃                             ┃")
print("┃           Ex 1-a            ┃")
print("┃                             ┃")
print("┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛")

# Plot    
plt.plot(xx, Epot, label="Epot",  linestyle='-', linewidth=3, color="turquoise")
plt.plot(xx, xx*0 + 4, label="x = 4",  linestyle='-', linewidth=3, color="dodgerblue")
plt.xlabel("x (m)")
plt.ylabel("Epot (J)")
plt.legend()
plt.grid()
plt.show()
