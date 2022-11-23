format rat

T = [0.7  0.2  0.3
     0.2  0.3  0.3
     0.1  0.5  0.4];

% P(sol2 * sol3 | sol1) =
% = P(sol1) * P(sol2 | sol1) * P(sol3 | sol2) =
1 * T(1, 1) * T(1, 1)
