    Osciladores >
    
- Harmónico Simples: a = (- k * xx[i] ) / m

- Harmónico Cúbico: a = (- k * xx[i] - alpha * xx[i]**3 ) / m

- Harmónico Amortecido: a = (- k * xx[i] - b * vx[i] ) / m

- Harmónico Forçado: a = (- k * xx[i] - F0 * cos(wf * t) ) / m


- Não Harmónico Quartico: a = (- k * xx[i] * (1 + x * alpha * xx[i]**2)) / m


- Osciladores Acoplados: 
                ax[i] = (-k * (xx[i] - xxEq) - kl * ((xx[i] - xxEq) - (xy[i] - xyEq))) / m
                ay[i] = (-k * (xy[i] - xyEq) + kl * ((xx[i] - xxEq) - (xy[i] - xyEq))) / m