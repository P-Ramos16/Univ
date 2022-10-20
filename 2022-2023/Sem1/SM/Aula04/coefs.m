function [ak, bk] = coefs(Ta, T0, x, K) 

    N = length(x);
    t = (0: (N-1))'*Ta;
    f = 1 / T0;

    ak = zeros(K+1,1);
    bk = zeros(K+1,1);

    ak(1) = mean(x);
    bk(1) = 0;


    for k=2:K+1
        ak(k) = (2/N)*x*cos(2*pi*(k-1)*f*t);
        bk(k) = (2/N)*x*sin(2*pi*(k-1)*f*t);   
    end
end