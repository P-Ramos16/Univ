function J = getDistances(Set,Nu)
    %% Calcula a distância de Jaccard entre todos os pares pela definição.
    J = zeros(Nu, Nu); % array para guardar distâncias
    h = waitbar(0, "Calculating");
    for n1 = 1:Nu
        waitbar(n1/Nu,h);
        for n2 = n1+1:Nu
            u1 = Set{n1,:};
            u2 = Set{n2,:};
            J(n1, n2) = 1 - (length(intersect(u1,u2)) / length(union(u1,u2)));
        end
    end
    delete(h)
    
    imagesc(J);
    colormap(gray);
    colorbar()
end

