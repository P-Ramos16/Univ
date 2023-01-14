function J = minHashUsers(Set, usersThatReviewedTheFilm, numHashF, bar)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.

    %Set(usersThatReviewedTheFilm, :) = [];
    NusersThatReviewed = length(usersThatReviewedTheFilm);
    Nu = length(Set);

    J = zeros(Nu, Nu); % array para guardar distâncias
    Assinaturas = zeros(Nu, numHashF);

    for n1 = 1:1:Nu
        waitbar((0.33*n1/Nu)+0.33,bar, sprintf("Calculating Users -> %3i %%", round(100*n1/Nu)));
        nUserInterests = 1;
        % Obter o número de interesses do utilizador
        while 1
            try
                if ismissing(Set{n1,nUserInterests+3})
                    break;
                end
            catch
                break;
            end
            nUserInterests = nUserInterests + 1;
        end
        nUserInterests = nUserInterests - 1;
        keys = double(zeros(nUserInterests, 1));
        %  Inserir cada cell de interesses do Set de Users num vetor keys
        for interest = 1:1:nUserInterests
            %  Cada carater do interesse é transformado em double
            % e depois todos os valores obtidos são sumados
            keys(interest) = sum(double(Set{n1,interest+3}));
        end

        for fh = 1:1:numHashF
            h = zeros(nUserInterests, 1);
            for i = 1:1:nUserInterests
                keys(i) = rem(keys(i)*fh, 2^31-1);
                h(i) = DJB31MA(keys(i), 255) + 1;
            end
            Assinaturas(n1,fh) = min(h);
        end
        
    end
    %  Para cada user que fez uma review ao filme original, comparar com
    % todos os outros users. A matriz J irá conter linhas vazias (0) para
    % userIDs que não deram review ao filme original
    % (mantendo assim o indice de linha como o ID de cada utilizador).
    for i1 = 1:NusersThatReviewed
        n1 = usersThatReviewedTheFilm(i1);
        for n2 = 1:Nu
            J(n1, n2) = sum(Assinaturas(n1,:) ~= Assinaturas(n2,:))/numHashF;
        end
    end
end
