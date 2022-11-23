   % Oceano Deserto Floresta Urbano
T = [0.1    0.2    0.25    0.25
     0.3    0.4    0.25    0.25
     0.3    0.2    0.25    0.25
     0.3    0.2    0.25    0.25];

%%

numTransicions = 1e5;
numSucessos = 0;
clear state


for n = 1:1:1e5
    % estado inicial
    start = ceil(rand()*4);
    arr = crawl(T, start, 5);
    if (arr(1) == 2 && arr(2) == 2 && arr(4) == 4 && arr(5) == 4)
        numSucessos = numSucessos + 1;
    end
end

res = numSucessos / 1e5


%%
function [state] = crawl(H, first, maxN)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    beta = 0.85;
    % keep moving from state to state until state "last" is reached:
    it = 0;
    while (1)
        if (rand() < beta)
            state(end+1) = nextState(H, state(end));
        else
            state(end+1) = ceil(rand()*length(H));
        end
        if maxN == it % verifies if state(end) is absorbing
            break;
        end
        it = it + 1;
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