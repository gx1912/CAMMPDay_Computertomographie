function ueberpruefeMatrix(Stelle,Matrixeintrag,PixelNummer,Abstand)

laengenmatrix = zeros(size(PixelNummer,2),Int(maximum(maximum(PixelNummer))));

if Stelle(4,5) == PixelNummer[4,5]
    if Matrixeintrag(5,4) ==  Abstand[5,4]
        for S = 1:size(PixelNummer,2)
            for Z = 1:size(PixelNummer,1)
                if Stelle(Z,S) > 0
                    wo = Int(Stelle(Z,S));
                    laengenmatrix[S,wo] = Matrixeintrag(Z,S);
                end
            end
        end
        println("Eure Formel für die Stelle an die der Wert geschrieben ist, ist korrekt.")
    else
        println("Schaut noch einmal eure Formel für die Bestimmung des Matrixeintrags an.")
    end
else
    if Matrixeintrag(5,4) ==  Abstand[5,4]
        println("Eure Formel für den Matrixeintrag, der in die Matrix geschrieben werden soll ist korrekt.")
        println("Schaut euch noch einmal eure Formel für die Stelle an, an die der Wert geschrieben werden soll.")
    else
        println("Beide eure Formeln sind noch nicht korrekt, überprüft eure Eingaben oder überlegt noch einmal neu.")
    end
end
return laengenmatrix;
end
