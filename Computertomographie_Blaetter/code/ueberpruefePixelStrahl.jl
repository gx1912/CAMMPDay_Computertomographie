function ueberpruefePixelStrahl(PixelNummer,Strahl, Pixel1,Pixel2, Pixel3, Pixel4, Pixel5)

if PixelNummer[1,Strahl] == Pixel1
    if PixelNummer[2,Strahl] == Pixel2
        if PixelNummer[3,Strahl] == Pixel3
            if PixelNummer[4,Strahl] == Pixel4
                if PixelNummer[5,Strahl] == Pixel5
                    println("Ihr habt korrekt erkannt durch welche Pixel der Strahl läuft!")
                else
                    println("Überprüft noch einmal den Eintrag für Pixel5.")
                end
            else
                println("Überprüft noch einmal den Eintrag für Pixel4.")
            end
        else
            println("Überprüft noch einmal den Eintrag für Pixel3.")
        end
    else
        println("Überprüft noch einmal den Eintrag für Pixel2.")
    end
else
    println("Überprüft noch einmal den Eintrag für Pixel1.")
end
       
end
