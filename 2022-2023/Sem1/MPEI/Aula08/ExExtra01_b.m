T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1];

numTransicions = 1e4;
numTransMinima = 0;
numTransMaximas = 0;

clear state
estado1 = ceil(rand()*3);
lengthArr = length(crawl(T, estado1, [4 5]));
numTransMinima = lengthArr;
numTransMaximas = lengthArr;


for i = 2:1:numTransicions
    estado1 = ceil(rand()*3);
    lengthArr = length(crawl(T, estado1, [4 5]))-1;
    if (lengthArr < numTransMinima)
        numTransMinima = lengthArr;
    elseif (lengthArr >  numTransMaximas)
        numTransMaximas = lengthArr;        
    end
end

numTransMinima
numTransMaximas




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