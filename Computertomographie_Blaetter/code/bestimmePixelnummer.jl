function bestimmePixelnummer(MittelpunkteX1,MittelpunkteX2,Pixelmitten)
    
PixelNummer = zeros(size(MittelpunkteX1,1),size(MittelpunkteX1,2));
AbstandPixelmitte = zeros(size(Pixelmitten,1),1);
Sortiert = zeros(size(Pixelmitten,1),1);
    
for Spalte = 1:size(MittelpunkteX1,2)
    for Zeile = 1:size(MittelpunkteX1,1)-1
        if (MittelpunkteX2[Zeile,Spalte] == 0) && (MittelpunkteX2[Zeile+1,Spalte] == 0) 
            PixelNummer[Zeile,Spalte] = 0;
        else
            for Pixelzeile = 1:size(Pixelmitten,1)
                AbstandPixelmitte[Pixelzeile] = sqrt((Pixelmitten[Pixelzeile,2]-MittelpunkteX1[Zeile,Spalte])^2+(Pixelmitten[Pixelzeile,3]-MittelpunkteX2[Zeile,Spalte])^2);
            end
            Sortiert= sortieren(AbstandPixelmitte,1,0); # suche Minimum
            Minimum = Sortiert[1,1];
            Ort = finde(AbstandPixelmitte, Minimum);
            x = Int(Ort[1,1]);
            PixelNummer[Zeile,Spalte] = x;
        end
    end
    for Zeile = size(MittelpunkteX1,1)
        if (MittelpunkteX2[Zeile,Spalte] == 0) && (MittelpunkteX2[Zeile-1,Spalte] == 0)
            PixelNummer[Zeile,Spalte] = 0;
        else
            for Pixelzeile = 1:size(Pixelmitten,1)
                AbstandPixelmitte[Pixelzeile] = sqrt((Pixelmitten[Pixelzeile,2]-MittelpunkteX1[Zeile,Spalte])^2+(Pixelmitten[Pixelzeile,3]-MittelpunkteX2[Zeile,Spalte])^2);
            end
            Sortiert= sortieren(AbstandPixelmitte,1,0); # suche Minimum
            Minimum = Sortiert[1,1];
            Ort = finde(AbstandPixelmitte, Minimum);
            x = Int(Ort[1,1]);
            PixelNummer[Zeile,Spalte] = x;
        end
    end
end
print("Pixelnummer: ");                    
show(stdout,"text/plain",Int.(PixelNummer));  
                
return PixelNummer;
            
end