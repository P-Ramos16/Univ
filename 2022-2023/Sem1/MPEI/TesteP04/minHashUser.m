function J = minHashFinal(Set,Nu, numHashF)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu, Nu); % array para guardar distâncias
    Assinaturas = zeros(Nu, numHashF);

    bar = waitbar(0, "Calculating");
    for n1 = 1:1:Nu
        waitbar(n1/Nu,bar);
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
    close(bar);

    % Para cada user n1 comparar com o user n2
    for n1 = 1:Nu
        for n2 = n1:1:Nu
            J(n1, n2) = sum(Assinaturas(n1,:) ~= Assinaturas(n2,:))/numHashF;
        end
    end
end
