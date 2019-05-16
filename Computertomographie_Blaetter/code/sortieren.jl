function sortieren(A,m,n)
    #n steht für 0 oder 1 
    # 0 bedeutet aufsteigend und 1 absteigend
    # m steht für die Spalte nach der sortiert werden soll

    C = zeros(size(A,1),size(A,2));
    
    if n == 0
        vec = A[:,m];
        vec = sort!(vec);
        for i = 1:size(A,1)
            Ort = finde(A[:,m],vec[i]);
            if size(Ort,1) ==1
                x = Int(Ort[1,1]);
                for j = 1:size(A,2)
                    C[i,j] = A[x,j];
                end
            else
                for k = 1:size(Ort,1)
                    x = Int(Ort[k,1]);
                    for j = 1:size(A,2)
                        C[i,j] = A[x,j];
                    end
                    end
            end
        end
    elseif n == 1
        vec = A[:,m];
        vec = sort!(vec,rev = true);
            
        for i = 1:size(A,1)
            Ort = finde(A[:,m],vec[i]);
            if size(Ort,1) ==1
                x = Int(Ort[1,1]);
                for j = 1:size(A,2)
                    C[i,j] = A[x,j];
                end
            else
                for k = 1:size(Ort,1)
                    x = Int(Ort[k,1]);
                    for j = 1:size(A,2)
                        C[i,j] = A[x,j];
                    end
                end
            end
        end
    end
return C;

end
