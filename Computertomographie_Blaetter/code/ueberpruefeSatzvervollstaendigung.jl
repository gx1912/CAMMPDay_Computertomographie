function ueberpruefeSatzvervollstaendigung(c,d)

if cmp(c,"abgeleitet") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"0") == 0 
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"Null") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"null") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"zero") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"Zero") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    else
        println("Eure Antwort für Wort3 ist korrekt, nicht aber die für Wort4. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.")
    end
elseif cmp(c,"abgelitten") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"0") == 0 
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"Null") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"null") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"zero") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"Zero") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    else
        println("Eure Antwort für Wort3 ist korrekt, nicht aber die für Wort4. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.")
    end
elseif cmp(c,"differenziert") == 0 #Null bedeutet richtig, stimmt überein
    if cmp(d,"0") == 0 
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"Null") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"null") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"zero") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    elseif cmp(d,"Zero") == 0
        println("Eure Antwort für Wort3 und Wort4 sind beide korrekt!");
    else
        println("Eure Antwort für Wort3 ist korrekt, nicht aber die für Wort4. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.")
    end
else      
    if cmp(d,"0") == 0 
        println("Eure Antwort für Wort4 ist korrekt, nicht aber die für Wort3. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    elseif cmp(d,"Null") == 0
        println("Eure Antwort für Wort4 ist korrekt, nicht aber die für Wort3. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    elseif cmp(d,"null") == 0
        println("Eure Antwort für Wort4 ist korrekt, nicht aber die für Wort3. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    elseif cmp(d,"zero") == 0
        println("Eure Antwort für Wort4 ist korrekt, nicht aber die für Wort3. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    elseif cmp(d,"Zero") == 0
        println("Eure Antwort für Wort4 ist korrekt, nicht aber die für Wort3. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.");
    else
        println("Eure Antworten für Wort3 und Wort4 sind noch nicht korrekt. Lest euch noch einmal den Satz durch und überprüft eure Rechtschreibung.")
    end
    
end


end