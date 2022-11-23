T = [0      0      0       0       5/10    0      0
     0      0      0       0       5/10    0      0
     1/3    0      2/10    1/10    0       0      0
     1/3    6/10   5/10    4/10    0       3/10   0
     0      0      0       0       0       0      0
     1/3    4/10   0       3/10    0       3/10   0
     0      0      3/10    2/10    0       4/10   1]

numTransicions = 1e5;
numSequencias= 0;
numSequenciasBoas = 0;

clear state

for i = 1:1:numTransicions
    arr = crawl(T, 5, [7]);
    if (length(arr) == 8 && arr(2) == 1)
        numSequenciasBoas = numSequenciasBoas + 1;
    end
    numSequencias = numSequencias +1;
end

res = numSequenciasBoas / numSequencias

fprintf("Resultado", res)

%%
function [state] = crawl(H, first, last)
    % the sequence of states will be saved in the vector "state"
    % initially, the vector contains only the initial state:
    state = [first];
    % keep moving from state to state until state "last" is reached:
    while (1)
        state(end+1) = nextState(H, state(end));
        if ismember(state(end), last) % verifies if state(end) is absorbing
            break;
        end
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