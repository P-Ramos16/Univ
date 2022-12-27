function J = getDistances_MinHash(Set,Nu)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu, Nu); % array para guardar distâncias
    h = waitbar(0, "Calculating");

    numHashF = 10;
    Assinaturas = zeros(Nu);

    for n1 = 1:Nu
        waitbar(n1/Nu,h);

        for fh = 1:1:numHashF
            conjunto = Set{n1,:};
            x = zeros(numHashF, length(conjunto));

            for i = 1:1:length(conjunto)
                elem = conjunto(i,1) + fh;
                hc = string2hash(elem);
                x(fh, i) = hc;
            end 
        end
        minimo = min(x);
        Assinaturas(n1) = {minimo};   
    end

    l = waitbar(0, "Calculating");
    for n1 = 1:Nu
        waitbar(n1/Nu,l);
        for n2 = n1+1:Nu

            numSame = sum(Assinaturas(n1,:) == Assinaturas(n2,:))

            %numSame = sum(Assinaturas(n1,:) == Assinaturas(n2,:));

            J(n1, n2) = 1 - (numSame / numHashF)
            %J(n1, n2) = 1 - (sum(Assinaturas(n1, :) == Assinaturas(n2, :)) / numHashF);
        end
    end

    delete(h);
    imagesc(J);
    colormap(gray);
    colorbar();
end



