function ueberpruefePixelkanten(X,Y)
if X == [-1.5 -0.5 0.5 1.5]
    if Y == [-1.5 -0.5 0.5 1.5]
        println("Ihr habt die Pixelkanten korrekt gewählt!")
    else
        println("Schaut euch noch einmal die Pixelkanten bei Y an.")
    end
else
    println("Überprüft noch einmal eure Eingaben.")
end
end