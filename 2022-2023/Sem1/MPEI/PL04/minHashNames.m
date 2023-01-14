function Assinaturas = minHashNames(Set, Nf, numHashF, bar)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.

    J = zeros(Nf, Nf); % array para guardar distâncias
    Assinaturas = zeros(Nf, numHashF);

    for n1 = 1:1:Nf
        try
            waitbar((0.33*n1/Nf)+0.66,bar, sprintf("Calculating Names -> %3i %%", round(100*n1/Nf)));
        catch
        end
        % Obter o número de interesses do utilizador
        nShingles = length(Set{n1,1});
        keys = double(zeros(nShingles, 1));

        %  Inserir cada cell de interesses do Set de Users num vetor keys
        for shingle = 1:1:nShingles
            %  Cada carater do interesse é transformado em double
            % e depois todos os valores obtidos são sumados
            keys(shingle) = sum(double(char(Set{n1,1}(shingle))));
        end

        for fh = 1:1:numHashF
            h = zeros(nShingles, 1);
            for i = 1:1:nShingles
                keys(i) = rem(keys(i)*fh, 2^31-1);
                h(i) = DJB31MA(keys(i), 127) + 1;
            end
            Assinaturas(n1,fh) = min(h);
        end
        
    end
    %  Para cada user que fez uma review ao filme original, comparar com
    % todos os outros users. A matriz J irá conter linhas vazias (0) para
    % userIDs que não deram review ao filme original
    % (mantendo assim o indice de linha como o ID de cada utilizador).
%     for n1 = 1:Nf
%         for n2 = n1+1:1:Nf
%             J(n1, n2) = sum(Assinaturas(n1,:) ~= Assinaturas(n2,:))/numHashF;
%         end
%     end
end
