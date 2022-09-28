n = 20
p = 0.5
N = 1e5
k = 0:n
for k = 0:n
    vp(k+1) = prob(k,n,p,N);
end


stem(0:n, vp)