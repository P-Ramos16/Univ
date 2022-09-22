n = 200
p = 0.5
N = 1e6

for k = 0:n
    vp(K+1) = prob(K,n,p,N)

end


stem(0:n, vp)