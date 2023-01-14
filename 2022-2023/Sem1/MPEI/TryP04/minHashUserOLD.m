function J = minHashUser(Set,Nu, userID)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu); % array para guardar distâncias
    numHashF = length(seeds);
    Assinaturas = zeros(Nu, numHashF);

    bar = waitbar(0, "Calculating");
    tic
    for n1 = 1:1:Nu
        waitbar(n1/Nu,bar);
        nFilms = length(Set{n1,:});
        keys = string(Set{n1,:}(:,1));
        for fh = 1:1:numHashF
            h = zeros(nFilms, 1)';
            for i = 1:1:nFilms
                %keys(i) = keys(i) + int2str(fh);
                keys(i) = append(keys(i), num2str(fh));
                h(i) = rem(DJB31MA(keys(i), 255), Nu*numHashF) + 1;
            end
            Assinaturas(n1,fh) = min(h);
        end
    end
    toc
    close(bar);
    % Para cada user n1 comparar com o user Inicial
    for n1 = 1:Nu
        J(n1) = sum(Assinaturas(n1,:) ~= Assinaturas(userID,:))/numHashF;
    end
end

