function ueberpruefeAbstand(SPX1,SPX2,dist,a,b)
eps = 1e-7;
Abstand = zeros(size(SPX1,1)-1,size(SPX1,2));
    
for Z = 3
    for S = 4
        if dist(3,4) == sqrt((SPX1[Z+1,S]-SPX1[Z,S])^2+(SPX2[Z+1,S]-SPX2[Z,S])^2)
            println("Eure verallgemeinerte Berechnung für den Abstand ist korrekt!")
            for Spalte = 1:size(SPX1,2)
                counter = 1;
                Schreiben = 1;
                for Zeile = 1:size(SPX1,1)-2
                    if (almostequal(SPX1[Zeile+1,Spalte], 0) && almostequal(SPX1[Zeile+2,Spalte], 0)) || (SPX1[Zeile,Spalte] <= a-eps) || (SPX2[Zeile,Spalte] <= a-eps) || (SPX1[Zeile+1,Spalte] <= a-eps) || (SPX2[Zeile+1,Spalte] <= a-eps) || (SPX1[Zeile,Spalte] >= b+eps) || (SPX2[Zeile,Spalte] >= b+eps) || (SPX1[Zeile+1,Spalte] >= b+eps) || (SPX2[Zeile+1,Spalte] >= b+eps) 
           
                        counter = counter+1;
                    else
                        Abstand[Schreiben,Spalte] = dist(Zeile,Spalte);
                        Schreiben = Schreiben+1;
                    end
                end
                for Zeile = size(SPX1,1)-1
                    if counter >= 3
            
                        counter = counter+1;
                    else
                        Abstand[Schreiben,Spalte] = dist(Zeile,Spalte);
                        Schreiben = Schreiben+1;
                    end
                end
            end
            Abstand
        elseif distance(3,4) == sqrt(SPX1[Z,S+1]-SPX1[Z,S])^2+(SPX2[Z,S+1]-SPX2[Z,S])^2
            println("Die Grundidee eurer Formel ist korrekt, jedoch stehen die Schnittpunkte für einen Strahl in einer Spalte und nicht in einer Zeile.")
        end
    end
end
print("Abstand: ");                    
show(stdout,"text/plain",Abstand);  
                
return Abstand;
                
end