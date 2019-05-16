function ueberpruefeeindeutigeLoesung3x2(A1,b1,A2,b2)

if size(A2,1) == 3 && size(A2,2) == 2 && size(b2,1) == 3 && size(b2,2) == 1
    y1 = inv(transpose(A1)*A1)*transpose(A1)*b1; 
    y2 = inv(transpose(A2)*A2)*transpose(A2)*b2; 
    if almostequal(y1[1], y2[1]) && almostequal(y1[2], y2[2])
        println("Super, ihr habt ein lineares Gleichungssystem aufgestellt, das sich eindeutig lösen lässt!");
        println("Eure Lösung lautet:");
        println("x1 = ",round(y2[1];digits=2));
        println("x2 = ",round(y2[2];digits=2));
    else       
        println("Die Größe eures Gleichungssystems stimmt zwar, allerdings lässt es sich nicht eindeutig lösen.")    
    end
else
    println("Ihr habt noch einen Fehler bei der Anzahl der Einträge in der Matrix oder dem Vektor. Stellt noch einmal sicher, dass ihr euer lineares Gleichungssystem von gerade um eine Zeile erweitert habt. Das heißt, dass sowohl der Vektor, als auch die Matrix, um eins in die Länge wachsen muss.")        
end

end
