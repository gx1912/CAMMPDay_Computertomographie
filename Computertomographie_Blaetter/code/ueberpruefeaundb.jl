function ueberpruefeaundb(PX1,PX2,theta,ParaX1,ParaX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,SPX1,SPX2)
eps = 1e-7;
counter = 2;
    
if size(SPX1,1) == 8    
    if a == -1.5
        if b == 1.5
            println("Ihr habt den Lückentext korrekt ausgefüllt!");
            interessanteX = zeros(size(SPX1,1),size(SPX2,2));
            interessanteY = zeros(size(SPX1,1),size(SPX2,2));
            for Spalte = 1:size(SPX1,2)
                inter = 1;
                for Zeile = 1:size(SPX1,1)
                    if (SPX1[Zeile,Spalte] >= a-eps) && (SPX1[Zeile,Spalte] <= b+eps) && (SPX2[Zeile,Spalte] >= a-eps) && (SPX2[Zeile,Spalte] <= b+eps)
                        interessanteX[inter,Spalte] = SPX1[Zeile,Spalte];
                        interessanteY[inter,Spalte] = SPX2[Zeile,Spalte];
                        inter = inter+1;
                    end
                end
            end
            irows = size(interessanteX,1);
            interessanteX = interessanteX[1:irows-2,:];
            interessanteY = interessanteY[1:irows-2,:];

            t1(Z,S,k) = (X[k]-StartpunktXWerte[Z,S])/cosd(Winkel[S]);
            t2(Z,S,k) = (Y[k]-StartpunktYWerte[Z,S])/sind(Winkel[S]);

            SchnittpunkteXWerte, SchnittpunkteYWerte, Plot= berechneallgemeineSchnittpunkte(PX1,PX2,theta,ParaX1,ParaX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,counter);
        else
            println("Überprüft noch einmal eine Angabe für b.");
            interessanteX = [];
            interessanteY = [];
        end
    else 
        if b == 1.5
            println("Überprüft noch einmal eine Angabe für a.");
            interessanteX = [];
            interessanteY = [];
        else
            println("Eure Eingaben sind leider beide falsch.");
            interessanteX = [];
            interessanteY = [];
        end
    end
else
   interessanteX = SPX1;
   interessanteY = SPX2;
   t1(Z,S,k) = (X[k]-StartpunktXWerte[Z,S])/cosd(Winkel[S]);
   t2(Z,S,k) = (Y[k]-StartpunktYWerte[Z,S])/sind(Winkel[S]);

    SchnittpunkteXWerte, SchnittpunkteYWerte, Plot=  berechneallgemeineSchnittpunkte(PX1,PX2,theta,ParaX1,ParaX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,counter);
end

print("SPX1: ");                    
show(stdout,"text/plain",SPX1);
print("\n\n SPX2: ");  
show(stdout,"text/plain",SPX2);
display(Plot);
                    
return interessanteX, interessanteY;

end
