numPaginas = 100;
lambda = 0.02 * numPaginas;

PkA = 0;

for k1 = 0:1:1
    PkA = PkA + ((lambda)^k1 / factorial(k1)) * exp(-lambda);
end

PkA