clear all;
format long;
   % A   B   C   D   E   F
H = [0   0   1   0   1   1    
     1   1   1   1   1   1  
     0   1   0   0   0   1  
     0   0   0   0   0   1  
     1   0   0   1   0   1  
     0   1   0   0   0   0  ];

saidas = sum(H);
H = H./saidas;
H(isnan(H)) = 0;    

prank = ones(length(H), 1) / length(H);

nIter = 5;
vals = zeros(length(H), nIter);

for iter = 1:1:nIter
    prank = H * prank;
    vals(:,iter) = prank;
end

k = 1:1:nIter;

hold on
plot(k, vals(1,:));
plot(k, vals(2,:));
plot(k, vals(3,:));
plot(k, vals(4,:));
plot(k, vals(5,:));
plot(k, vals(6,:));
hold off

legend("Estado 1", "Estado 2", "Estado 3", "Estado 4", "Estado 5", "Estado 6")
prank