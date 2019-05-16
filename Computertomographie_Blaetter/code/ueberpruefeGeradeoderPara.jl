function  ueberpruefeGeradeoderPara(PX1,PX2,theta,Geradengleichung,a,b,ParameterdarstellungX1,ParameterdarstellungX2)

t = 0.6221;
Z = 3;
S = 1;
x = 0.7291;
Wahl = [];

if isnan(ParameterdarstellungX1(t,Z,S)) && isnan(ParameterdarstellungX1(t,Z,S)) && !isnan(Geradengleichung(Z,S,x))
    if Geradengleichung(Z,S,x) == tand(theta[S])*x+PX2[Z,S]-tand(theta[S])*PX1[Z,S]
        println("Ihr habt die Geradengleichung korrekt aufgestellt!")
        Wahl = 5.4; # 5.4 steht für Gerade
    elseif Geradengleichung(Z,S,x) == cosd(theta[S])*x+PX2[Z,S]-cosd(theta[S])*PX1[Z,S]
        println("Schaut euch noch einmal die Definitionen von Kosinus, Sinus und Tangens an und überprüft eure Gleichung.")
        Wahl = [];
    elseif Geradengleichung(Z,S,x) == sind(theta(S))*x+PX2(Z,S)-sind(theta(S))*PX1(Z,S)
        println("Schaut euch noch einmal die Definitionen von Kosinus, Sinus und Tangens an und überprüft eure Gleichung.")
        Wahl = [];
    else
        println("Eure Gleichung ist noch nicht korrekt.")
        Wahl = [];
    end
elseif !isnan(ParameterdarstellungX1(t,Z,S)) && !isnan(ParameterdarstellungX1(t,Z,S)) && isnan(Geradengleichung(Z,S,x))
   if ParameterdarstellungX1(t,Z,S) == PX1[Z,S]+t*cosd(theta[S])
        if ParameterdarstellungX2(t,Z,S) == PX2[Z,S]+t*sind(theta[S])
            println("Eure Parameterdarstellung für die Strahlen ist korrekt!");
            Wahl = 3.7; # 1 steht für Parameterdarstellung
        elseif ParameterdarstellungX2(t,Z,S) == PX2[Z,S]+t*cosd(theta[S])
            println("Der Teil für die X1 Koordinate ist korrekt. Schaut euch für die X2 Koordinaten noch einmal an, wie der Kosinus und Sinus definiert sind.")
            Wahl = [];
        else
            println("Der Teil für die X1 Koordinate ist korrekt. Überprüft erneut eure Formel für die X2 Koordinate.")
            Wahl = [];
        end
    elseif ParameterdarstellungX1(t,Z,S) == PX1[Z,S]+t*sind(theta[S])
        if ParameterdarstellungX2(t,Z,S) == PX2[Z,S]+t*sind(theta[S])
            println("Der Teil für die X2 Koordinate ist korrekt. Schaut euch für die X1 Koordinaten noch einmal an, wie der Kosinus und Sinus definiert sind.")
            Wahl = [];
        else
            println("Schaut euch erneut an, wie der Sinus und Kosinus definiert sind und überprüft erneut eure Formeln.")
            Wahl = [];
        end
    else
        println("Schaut euch erneut an, wie der Sinus und Kosinus definiert sind und überprüft erneut eure Formeln.")
        Wahl = [];
   end
else
    println("Ihr müsst euch für eine der beiden Darstellungsarten entscheiden.")
    Wahl = [];
end
return Wahl;                                        
end
