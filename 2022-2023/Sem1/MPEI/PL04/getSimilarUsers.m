function SimilarUsers = getSimilarUsers(J, usersThatReviewedTheFilm, threshold)
    %% Com base na distância, determina pares com
    %% distância inferior a um limiar pré-definido
        
    Nu = size(J);
    Nu = Nu(2);
    % Array para guardar pares similares (user1ID, user2ID, distância)
    SimilarUsers= zeros(1,3);
    k= 1;
    for n1 = 1:Nu
        %  Ignorar procurar a distancia de Jaccard entre users que não
        %  interessam (ambos não viram o filme original)
        if ~ismember(n1, usersThatReviewedTheFilm)
                continue;
        end
        for n2 = 1:Nu
            %  Ignorar comprar o mesmo user a sí próprio
            if n1 == n2
                continue;
            end
            if J(n1, n2) < threshold
                %  Guardar o userID do user que já viu o filme, o userID do
                % user parecido mas que não viu o filme e a distancia de
                % Jaccard entre os dois
                SimilarUsers(k,:) = [n1 n2 J(n1, n2)];
                k = k+1;
            end
        end
    end
end

