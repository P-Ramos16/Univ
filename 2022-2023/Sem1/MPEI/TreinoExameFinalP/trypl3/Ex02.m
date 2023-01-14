T = [1/3   1/4   0
     1/3   11/20 1/2
     1/3   1/5   1/2];


sum(T)
T >= 0 & T <= 1

v0 = [60 15 15]';

res = (T^30) * v0;
round(res)

v0 = [30 30 30]';

res = (T^30) * v0;
round(res)

% O mesmo pq estabiliza