function ueberpruefeStartpunkt(SPX1,SPX2,PX1,PX2)

if round(SPX1;digits=2) == round(PX1[1,2];digits = 2)
    if round(SPX2;digits=2) == round(PX2[1,2];digits = 2)
        println("Ihr habt die korrekten Koordinaten für den Startpunkt ausgewählt!")
    else
        println("Überprüft erneut eure Eingabe für die X2 Koordinate des Startpunkts.")
    end
elseif round(SPX1;digits = 2) == round(PX1[2,1];digits = 2)
    if round(SPX2;digits = 2) == round(PX2[2,1];digits = 2)
        println("Eure Eingaben stimmen noch nicht ganz. Die erste Zahl in der Klammer steht für die Zeile und die zweite für die Spalte.")
    else
        println("Eure Eingabe für X1 stimmt noch nicht ganz. Die erste Zahl in der Klammer steht für die Zeile und die zweite für die Spalte.")
    end
else
    println("Überprüft erneut eure Eingaben für beide Koordinaten des Startpunkts.")
end
end