function ueberpruefeLGS(Gleichungssystem,f1,f2,f3,f4)

if Gleichungssystem(f1,f2,f3,f4) == [0;0;0;0]
    println("Ihr habt das lineare Gleichungssystem korrekt aufgestellt!")
else
    println("Überprüft noch einmal eure Eingabe.")
end
    
end
