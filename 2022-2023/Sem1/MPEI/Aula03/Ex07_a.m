clear all

ProbA = 0.01;
ProbB = 0.05;
ProbC = 0.001;

ProgramasA = 20;
ProgramasB = 30;
ProgramasC = 50;
numProgTotal = 100;

        %  A: Programa com erro
        %  B: Programa do Carlos

N = 1e5;    % num experiencias
m = 3;      % num programas
n = 1;      % num escolhas


        % Prob alinea a => P(Carlos|Erro) = P(Carlos e Erro) / P(Erro)

% Array de zeros e uns se cada programa do André tem erro ou nao
arrayA   =  rand(ProgramasA, N) < ProbA;
arrayB   =  rand(ProgramasB, N) < ProbB;
arrayC   =  rand(ProgramasC, N) < ProbC;

array = [arrayA; arrayB; arrayC];

% Casos Favoraveis de Erro
CasosFavErro = sum(sum(array));

% Casos Favoraveis Carlos e Erro
CasosFavErroCarlos = sum(sum(arrayC));

% P(Carlos|Erro)
ProbCarlosDadoQueErro = CasosFavErroCarlos / CasosFavErro


% Casos Favoraveis Bruno e Erro
CasosFavErroBruno = sum(sum(arrayB));

% P(Bruno|Erro)
ProbBrunoDadoQueErro = CasosFavErroBruno / CasosFavErro


% Casos Favoraveis Andre e Erro
CasosFavErroAndre = sum(sum(arrayA));

% P(Andre|Erro)
ProbAndreDadoQueErro = CasosFavErroAndre / CasosFavErro
