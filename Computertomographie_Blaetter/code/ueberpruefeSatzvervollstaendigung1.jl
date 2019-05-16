function ueberpruefeSatzvervollstaendigung1(c,d)

if cmp(c,"Zeilen") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"Spalten") == 0 
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    elseif cmp(d,"spalten") == 0
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    else
        println("Eure Antwort für Wort1 ist korrekt, nicht aber die für Wort2. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    end
elseif cmp(c,"zeilen") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"Spalten") == 0 
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    elseif cmp(d,"spalten") == 0
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    else
        println("Eure Antwort für Wort1 ist korrekt, nicht aber die für Wort2. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    end
elseif cmp(c,"Reihen") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"Spalten") == 0 
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    elseif cmp(d,"spalten") == 0
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    else
        println("Eure Antwort für Wort1 ist korrekt, nicht aber die für Wort2. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    end
elseif cmp(c,"reihen") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"Spalten") == 0 
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    elseif cmp(d,"spalten") == 0
        println("Eure Antwort für Wort1 und Wort2 sind beide korrekt!");
    else
        println("Eure Antwort für Wort1 ist korrekt, nicht aber die für Wort2. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    end
else
    if cmp(d,"Spalten") == 0 
        println("Eure Antwort für Wort2 ist korrekt, nicht aber die für Wort1. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    elseif cmp(d,"spalten") == 0
        println("Eure Antwort für Wort2 ist korrekt, nicht aber die für Wort1. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    else
        println("Eure Antworten für Wort1 und Wort2 sind noch nicht korrekt. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    end
end



end