T = [0.7 0.8
     0.3 0.2];

v0Estar = [1 0]';
v0NaoEstar = [0 1]';

duasIter = (T^2) * v0Estar
duasIter = (T^2) * v0NaoEstar

quinzeIter = (T^31) * v0Estar