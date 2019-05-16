function ueberpruefeLaengeStrahl(A,Strahl,Laenge1, Laenge2, Laenge3,Laenge4, Laenge5, Laenge6,Laenge7,Laenge8,Laenge9)

if round(A[Strahl,1];digits=1) == round(Laenge1;digits=1)
    if round(A[Strahl,2];digits=1) == round(Laenge2;digits=1)
        if round(A[Strahl,3];digits=1) == round(Laenge3;digits=1)
            if round(A[Strahl,4];digits=1) == round(Laenge4;digits=1)
                if round(A[Strahl,5];digits=1) == round(Laenge5;digits=1)
                    if round(A[Strahl,6];digits=1) == round(Laenge6;digits=1)
                        if round(A[Strahl,7];digits=1) == round(Laenge7;digits=1)
                           if round(A[Strahl,8];digits=1) == round(Laenge8;digits=1)
                               if round(A[Strahl,9];digits=1) == round(Laenge9;digits=1)
                                    println("Ihr habt die Zeile der Matrix korrekt interpretiert.")
                               else
                                    println("Überprüft noch einmal den Eintrag für Laenge9.")
                               end
                           else
                                println("Überprüft noch einmal den Eintrag für Laenge8.")
                           end
                        else
                            println("Überprüft noch einmal den Eintrag für Laenge7.")
                        end
                    else
                        println("Überprüft noch einmal den Eintrag für Laenge6.")
                    end
                else
                    println("Überprüft noch einmal den Eintrag für Laenge5.")
                end
            else
                println("Überprüft noch einmal den Eintrag für Laenge4.")
            end
        else
            println("Überprüft noch einmal den Eintrag für Laenge3.")
        end
    else
         println("Überprüft noch einmal den Eintrag für Laenge2.")
    end
else
    println("Überprüft noch einmal den Eintrag für Laenge1.")
end
       
end
