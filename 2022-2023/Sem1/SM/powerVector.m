function [outputVector] = powerVector(inputVector, Ta, T)
    N = T / Ta;
    outputVector = (inputVector * inputVector.') / N;
end