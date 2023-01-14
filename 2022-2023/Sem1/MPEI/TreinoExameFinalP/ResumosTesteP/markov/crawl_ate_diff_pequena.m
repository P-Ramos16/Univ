T = [0   1/2    1/2   0     1/4     0
     1   0      0     0     1/4     0
     0   0      0     1     1/4     0
     0   0      1/2   0     1/4     1
     0   0      0     0     0       0
     0   1/2    0     0     0       0];

limiarDiff = 1e-3;
pageRank = zeros(length(T), 1);

clear state

start = ceil(rand()*6);
pageRank = crawl(T, start, limiarDiff);

pageRank

%  A melhor página é a D e a pior é a E

%%
function [pagerank] = crawl(H, first, limiarDiff)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    pagerank = zeros(length(H), 1);
    prank = zeros(size(H));
    newpRank = zeros(size(H));
    nEstados = length(H)^2;
    beta = 0.85;
    % keep moving from state to state until state "last" is reached:
    it = 0;
    newstate = first;
    while (1)
        %  Se todas excederem, corta a execução
        diffMatrizes = abs(pagerank - newpRank);
        if sum(diffMatrizes(:) < limiarDiff) == nEstados && it ~= 0
            return;
        end
        pagerank = newpRank;
        if (rand() < beta)
            newstate = nextState(H, newstate);
            prank(newstate) = prank(newstate)+1;
        else
            newstate = ceil(rand()*length(H));
            prank(newstate) = prank(newstate)+1;
        end
        it = it + 1;
        newpRank = prank/it;
    end
end

function state = nextState(H, currentState)
    % find the probabilities of reaching all states starting at the current one:
    probVector = H(:,currentState)'; % probVector is a row vector
    n = length(probVector); %n is the number of states
    % generate the next state randomly according to probabilities probVector:
    state = discrete_rnd(1:n, probVector);
end

function state = discrete_rnd(states, probVector)
    U=rand();
    i = 1 + sum(U > cumsum(probVector));
    state= states(i);
end