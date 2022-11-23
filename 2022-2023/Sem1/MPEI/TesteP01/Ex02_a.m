load('L.mat')

N = length(L)

paginasDeadEnd = {};


for i = 1:1:N
    if sum(L(:,i)) == 0
        paginasDeadEnd = [paginasDeadEnd, i];
    end
end

paginasDeadEnd  