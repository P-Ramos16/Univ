function SimilarUsers = getSimilarFilms(J, Nu, threshold, users)
    %% Com base na distância, determina pares com
    %% distância inferior a um limiar pré-definido
        
    % Array para guardar pares similares (user1, distância)
    SimilarUsers= zeros(1,2);
    k= 1;
    for n1 = 1:Nu
        if J(n1) < threshold
            SimilarUsers(k,:) = [users(n1) J(n1)];
            k = k+1;
        end
    end
end

