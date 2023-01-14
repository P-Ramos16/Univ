function J = minHashFilms(Set, Nu, filmID, numHashF, bar)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu, Nu); % array para guardar distâncias
    Assinaturas = zeros(Nu, numHashF);

    for n1 = 1:1:Nu
        waitbar(0.33*n1/Nu,bar, sprintf("Calculating Films -> %3i %%", round(100*n1/Nu)));
        nFilms = length(Set{n1,:});
        keys = Set{n1,:}(:,1);

        for fh = 1:1:numHashF
            h = zeros(nFilms, 1);
            for i = 1:1:nFilms
                keys(i) = rem(keys(i)*fh, 2^31-1);
                h(i) = DJB31MA(keys(i), 255) + 1;
            end
            Assinaturas(n1,fh) = min(h);
        end
        
    end

    % Para cada filme n1 comparar com o filme filmID
    for n1 = 1:Nu
        J(n1) = sum(Assinaturas(n1,:) ~= Assinaturas(filmID,:))/numHashF;
    end
end
