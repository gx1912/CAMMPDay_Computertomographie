function ueberpruefeeindeutigeLoesung2x2(A,b)

if size(A,1) == 2 && size(A,2) == 2 && size(b,1) == 2 && size(b,2) == 1
           
    homogen = nullspace(A);
    # inhomogene Lösung berechnen
    inhomogen = pinv(A)*b;
        
    if size(homogen,2) > 0
        println("Die Größe eures Gleichungssystems stimmt zwar, allerdings lässt es sich nicht eindeutig lösen.")
    else
        println("Super, ihr habt ein lineares Gleichungssystem aufgestellt, das sich eindeutig lösen lässt!");
        y1 = inv(transpose(A)*A)*transpose(A)*b;
        println("Eure Lösung lautet:");
        println("x1 = ",round(y1[1];digits=2));
        println("x2 = ",round(y1[2];digits=2));
    end
else
    println("Ihr habt noch einen Fehler bei der Anzahl der Einträge in der Matrix oder dem Vektor. Stellt noch einmal sicher, dass ihr ein lineares Gleichungssystem mit einer 2x2 Matrix augestellt habt.")        
end

end
