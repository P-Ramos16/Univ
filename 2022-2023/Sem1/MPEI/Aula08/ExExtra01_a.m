T = [0.8    0       0.3     0   0
     0.2    0.6     0.2     0   0
     0      0.1     0.4     0   0
     0      0.3     0       1   0
     0      0       0.1     0   1];

numTransicions = 1e4;
transTillAbsor = zeros(numTransicions, 1);

estadosAbsor3 = 0;
estadosAbsor5 = 0;

clear state
for i = 1:1:numTransicions
    arrEstados = crawl(T, 1, [4 5]);
    transTillAbsor(i) = length(arrEstados) - 1;
    if arrEstados(length(arrEstados)-1) == 3
        estadosAbsor3 = estadosAbsor3 + 1;
    else 
        estadosAbsor5 = estadosAbsor5 + 1;
    end
end
EstadoInicial1 = sum(transTillAbsor) / numTransicions
absorvenciasEstado3 = estadosAbsor3 / numTransicions
absorvenciasEstado5 = estadosAbsor5 / numTransicions


clear state
for i = 1:1:numTransicions
    transTillAbsor(i) = length(crawl(T, 2, [4 5])) - 1;
end
EstadoInicial2 = sum(transTillAbsor) / numTransicions


clear state
for i = 1:1:numTransicions
    transTillAbsor(i) = length(crawl(T, 3, [4 5])) - 1;
end
EstadoInicial4 = sum(transTillAbsor) / numTransicions

%  Mesmos resultados (com baixa diferença) das alíneas 6 F e G


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