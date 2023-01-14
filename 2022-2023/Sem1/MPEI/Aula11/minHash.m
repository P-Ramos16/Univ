function J = minHash(Set,Nu)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu, Nu); % array para guardar distâncias
    bar = waitbar(0, "Calculating");

    numHashF = 15;
    conjunto = Set{3,:};
    Assinaturas = zeros(Nu, length(conjunto) );
    lenMat = min(length(Set))

    for n1 = 1:Nu
        waitbar(n1/Nu,bar);
        keys = zeros(numHashF);

        for fh = 1:1:numHashF
            conjunto = Set{n1,:};
            keys = string(conjunto(:,1));
            h = zeros(numHashF, length(conjunto));
            for i = 1:1:length(conjunto)
                keys(i) = strcat(keys(i), int2str(i));
                h(fh, i) = rem(string2hash(keys(i)), length(conjunto)) + 1;
            end 
        end 

        Assinaturas(n1,:) = min(h)
    end

    Assinaturas(1)

    l = waitbar(0, "Calculating");
    for n1 = 1:Nu
        waitbar(n1/Nu,l);
        for n2 = n1+1:Nu
            numSame = sum(Assinaturas(n1) == Assinaturas(n2));
            J(n1, n2) = 1 - (numSame / numHashF);
        end
    end
    
    imagesc(J);
    colormap(gray);
    colorbar();
end

