function J = minHashFilms(Set,Nu)
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
                h(i) = rem(DJB31MA(keys(i), 255), Nu*numHashF) + 1;
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
        end
    end
end
