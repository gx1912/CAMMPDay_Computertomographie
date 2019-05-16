function erstelleMatrix(Abstand,PixelNummer,nx1,nx2)

#Stelle(Z,S) = PixelNummer(Z,S);
#Matrixeintrag(Z,S) =  Abstand(Z,S);

laengenmatrix = zeros(size(PixelNummer,2),nx1*nx2);
for S = 1:size(PixelNummer,2)
    for Z = 1:size(PixelNummer,1)
        if PixelNummer[Z,S] > 0
            wo = Int(PixelNummer[Z,S]);
            laengenmatrix[S,wo] = Abstand[Z,S];
        end
    end
end
print("A: ");                    
show(stdout,"text/plain",laengenmatrix);  
                
    return laengenmatrix;
end