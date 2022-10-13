N = 1e5;      %  num experiencias
n = 2;        %  num lançamentos 
m = 3;     %  valor maximo


                %  A: Sequencia "um dois"
                %  B: Sequencia tem pelo menos um "um"
                %  C: Sequencia tem "um" e "dois"
                %  D: P(B|Sequencia tem pelo menos um "dois")


array   =  randi(m, n, N); % é o mesmo disto: ceil(rand(n,N) * m);
         % array de tamanho 2 com numeros de 1 a 6

SucessosA = 0;
SucessosB = 0;
SucessosC = 0;
SucessosD = 0;

for col=1:N
    % Prob de A
    if array(1,col) == 1 && array(2,col) == 2
        SucessosA = SucessosA + 1;
    end


    % Prob de B
    if array(1,col) == 1 || array(2,col) == 1
        SucessosB = SucessosB + 1;
    end


    % Prob de C
    if (array(1,col) == 1 || array(2,col) == 1) && (array(1,col) == 2 || array(2,col) == 2)
        SucessosC = SucessosC + 1;
    end

    % Pelo menos um "dois"
    if array(1,col) == 2 || array(2,col) == 2
        SucessosD = SucessosD + 1;
    end

end

ProbA = SucessosA / N
ProbB = SucessosB / N
ProbC = SucessosC / N

ProbD = SucessosB / SucessosD