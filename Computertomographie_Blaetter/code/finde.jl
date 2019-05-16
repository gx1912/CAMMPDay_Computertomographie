function finde(A,n)
    Antwort = zeros(size(A,1)*size(A,2),2);
    counter = 1;
    for i = 1:size(A,1)
        for j = 1:size(A,2)
            if A[i,j] == n
                Antwort[counter,1] = i;
                Antwort[counter,2] = j;
                counter = counter+1;
            end
        end
    end
    X = Antwort[:,1];
    Y = Antwort[:,2];
    #display(X)
    #display(Y)
    #display(counter)
    Antwort1 = resize(Antwort[:,1],counter-1);
    Antwort2 = resize(Antwort[:,2],counter-1);
    Antwortneu = hcat(Antwort1,Antwort2);
return Antwortneu;

end
