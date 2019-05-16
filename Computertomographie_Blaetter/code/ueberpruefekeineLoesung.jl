function ueberpruefekeineLoesung(A1,b1,A3,b3,blick1,blick2)

if size(A3,1) == 3 && size(A3,2) == 2 && size(b3,1) == 3 && size(b3,2) == 1
    y1 = inv(transpose(A1)*A1)*transpose(A1)*b1;
    if norm(transpose(A3[3,:])*y1-b3[3]) < 0.0001
        println("Die Größe eures Gleichungssystems stimmt zwar, allerdings lässt es sich immernoch eindeutig lösen.")
    else
        println("Ihr habt den Vektor korrekt verändert. Das führt dazu, dass es keine Lösung mehr hat.");
        println("Das Problem ist, dass egal, welchen Vektor man als x bei A*x von euch einsetzt, bekommt man nicht euren b-Vektor heraus. Veranschaulicht könnt ihr das in der folgenden Graphik sehen. Alle möglichen b-Vektoren für unterschiedliche x liegen in der roten Ebene. Euer Punkt jedoch liegt außerhalb.");
        println("Ändert solange die Werte für blick1 und blick2, so dass man erkennt, dass der Punkt neben der Ebene liegt.")
        U2,S2,V2 = svd(A3)
        u = U2[:,1];
        v = U2[:,2];
        s = -20*u-20*v;
        a = b3[1];
        b = b3[2];
        c = b3[3];
        plt = surface([(s[1],s[2],s[3]),(30*u[1],30*u[2],30*u[3]),(30*v[1],30*v[2],30*v[3])],alpha=.1, fillalpha=.1)
        plot3d!([a],[b],[c],marker=2,xlim=(-14,14),ylim=(-14,14),zlim=(-14,14), camera = (blick1,blick2),cbar= :none, leg = false,xlabel = "x_1",ylabel = "x_2",zlabel = "x_3")
        
        plt       
    end
else
    println("Ihr habt noch einen Fehler bei der Anzahl der Einträge in der Matrix oder dem Vektor. Stellt noch einmal sicher, dass ihr euer lineares Gleichungssystem aus a) um eine Zeile erweitert habt. Das heißt, dass sowohl der Vektor, als auch die Matrix, um eins in die Länge wachsen muss.")        
end
display(plt);
return u,v;
end
