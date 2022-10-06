N = 1e5;      %  num experiencias
n = 2;        %  num lançamentos 
m = 6;     %  valor maximo


                %  A: Soma dos dois valores é igual a 9
                %  B: O segundo valor é par
                %  C: Pelo menos um valor é 5
                %  D: Nenhum dos valores é 1


array   =  randi(m, n, N); % é o mesmo disto: ceil(rand(n,N) * m);
         % array de tamanho 2 com numeros de 1 a 6

SucessosA = 0;
SucessosB = 0;
SucessosC = 0;
SucessosD = 0;

for col=1:N
    % Prob de A
    if sum(array(:,col)) == 9
        SucessosA = SucessosA + 1;
    end


    % Prob de B
    % rem(a, b) = remainder of division de a por b
    % array(2,:) daria um array só da linha 2
    if rem(array(2,col), 2) == 0
        SucessosB = SucessosB + 1;
    end


    % Prob de C
    if array(1,col) == 5 || array(2,col) == 5
        SucessosC = SucessosC + 1;
    end


    % Prob de D
    if array(1,col) ~= 1 && array(2,col) ~= 1
        SucessosD = SucessosD + 1;
    end
end

ProbA = SucessosA / N
ProbB = SucessosB / N
ProbC = SucessosC / N
ProbD = SucessosD / N
