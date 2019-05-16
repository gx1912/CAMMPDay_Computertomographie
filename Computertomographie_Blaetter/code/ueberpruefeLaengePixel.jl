function ueberpruefeLaengePixel(A,Pixel,Laenge1, Laenge2, Laenge3,Laenge4, Laenge5, Laenge6,Laenge7,Laenge8,Laenge9,Laenge10,Laenge11,Laenge12)

if round(A[1,Pixel];digits=1) == round(Laenge1;digits=1)
    if round(A[2,Pixel];digits=1) == round(Laenge2;digits=1)
        if round(A[3,Pixel];digits=1) == round(Laenge3;digits=1)
            if round(A[4,Pixel];digits=1) == round(Laenge4;digits=1)
                if round(A[5,Pixel];digits=1) == round(Laenge5;digits=1)
                    if round(A[6,Pixel];digits=1) == round(Laenge6;digits=1)
                        if round(A[7,Pixel];digits=1) == round(Laenge7;digits=1)
                           if round(A[8,Pixel];digits=1) == round(Laenge8;digits=1)
                               if round(A[9,Pixel];digits=1) == round(Laenge9;digits=1)
                                   if round(A[10,Pixel];digits=1) == round(Laenge10;digits=1)
                                        if round(A[11,Pixel];digits=1) == round(Laenge11;digits=1)
                                            if round(A[12,Pixel];digits=1) == round(Laenge12;digits=1)
                                                println("Ihr habt die Spalte der Matrix korrekt interpretiert.")
                                            else
                                                println("Überprüft noch einmal den Eintrag für Laenge12.")
                                            end
                                        else
                                            println("Überprüft noch einmal den Eintrag für Laenge11.")
                                        end
                                   else
                                        println("Überprüft noch einmal den Eintrag für Laenge10.")
                                   end
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
