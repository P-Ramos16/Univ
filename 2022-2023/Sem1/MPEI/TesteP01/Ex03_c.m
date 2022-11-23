   % A      C       O       R       T       FIM
T = [0      5/10    0       7/30    5/10    0
    7/30    0       7/30    0       0       0
    0       5/10    0       7/30    5/10    0
    7/30    0       7/30    0       0       0
    7/30    0       7/30    7/30    0       0
    3/10    0       3/10    3/10    0       0]
     
%%
palavra = {};

letras = ["A" "C" "O" "R" "T" "."];

arr = crawl(T, 5, [6]);

for i = 1:1:length(arr)
    n = arr(i);
    palavra = [palavra letras(n)];
end

palavra


% if the Markov chain has more than 1 absorving state the third argument
% must be a vector with the absorving states
% for example in a chain with 5 states,and considering that states 4 and 5 are absorbing states:
% state = crawl(H5, 1,  [4 5])  
% Random walk on the Markov chain
% Inputs:
% H - state transition matrix
% first - initial state
% last - terminal or absorving state
function [state] = crawl(H, first, last)
     % the sequence of states will be saved in the vector "state"
     % initially, the vector contains only the initial state:
     state = [first];
     % keep moving from state to state until state "last" is reached:
     while (1)
          state(end+1) = nextState(H, state(end));
          if ismember(state(end), last) % verifies if state(end) is absorving
              break;
          end
     end
end

% Returning the next state
% Inputs:
% H - state transition matrix
% currentState - current state
function state = nextState(H, currentState)
     % find the probabilities of reaching all states starting at the current one:
     probVector = H(:,currentState)';  % probVector is a row vector 
     n = length(probVector);  %n is the number of states
     % generate the next state randomly according to probabilities probVector:
     state = discrete_rnd(1:n, probVector);
end

% Generate randomly the next state.
% Inputs:
% states = vector with state values
% probVector = probability vector 
function state = discrete_rnd(states, probVector)
     U=rand();
     i = 1 + sum(U > cumsum(probVector));
     state= states(i);
end