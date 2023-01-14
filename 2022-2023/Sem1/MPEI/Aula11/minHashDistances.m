function J = minHashDistances(Set,Nu)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu, Nu); % array para guardar distâncias
    numHashF = 100;
    Assinaturas = zeros(Nu, numHashF);

    bar = waitbar(0, "Calculating");
    tic
    for n1 = 1:1:Nu
        waitbar(n1/Nu,bar);
        conjunto = Set{n1,:};
        keys = string(conjunto(:,1)');
        for fh = 1:1:numHashF
            h = zeros(length(conjunto), 1)';
            for i = 1:1:length(conjunto)
                keys(i) = keys(i) + (fh);
                %keys(i) = append(keys(i), num2str(fh));
                %h(i) = hashstring(keys(i), length(conjunto));
                h(i) = rem(DJB31MA(keys(i), 255), Nu*numHashF) + 1;
                %h(i) = mod(string2hash(keys(i)), length(conjunto)) + 1;
                %h(i) = string2hash(keys(i));
            end
            Assinaturas(n1,fh) = min(h); % MAX?????? devia ser MIN!!!!
        end
    end
    toc

    l = waitbar(0, "Calculating");
    % Para cada user n1
    for n1 = 1:Nu
        waitbar(n1/Nu,l);
        % Comparar com o user n2
        for n2 = n1+1:Nu
            J(n1,n2) = sum(Assinaturas(n1,:) ~= Assinaturas(n2,:))/numHashF; 
            
%            numSame = 0;
%            % para cada hash function
%             for hashF = 1:1:numHashF
%                 % comparar cada assinatura
%                 if Assinaturas(n1, hashF) == Assinaturas(n2, hashF)
%                     numSame = numSame + 1;
%                 end
%             end
%            % num iguais a dividir por num total
%            J(n1, n2) = 1 - (numSame / numHashF);
        end
    end
    
    imagesc(J);
    colormap(gray);
    colorbar();
end

