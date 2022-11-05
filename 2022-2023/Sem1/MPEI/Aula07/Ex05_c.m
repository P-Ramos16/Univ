T = [0.7  0.2  0.3
     0.2  0.3  0.3
     0.1  0.5  0.4]


% P(chuva2 * chuva3 | sol1) =
% = P(sol1) * P(chuva2 | sol1) * P(chiva3 | chuva2) =
prob = 1 - 1 * T(3, 1) * T(3, 3)
