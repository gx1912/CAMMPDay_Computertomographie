function  ueberpruefePara(PX1,PX2,theta,a,b,ParameterdarstellungX1,ParameterdarstellungX2)

t = 0.6221;
Z = 3;
S = 1;
x = 0.7291;

   if ParameterdarstellungX1(t,Z,S) == PX1[Z,S]+t*cosd(theta[S])
        if ParameterdarstellungX2(t,Z,S) == PX2[Z,S]+t*sind(theta[S])
            println("Eure Parameterdarstellung für die Strahlen ist korrekt!");
        elseif ParameterdarstellungX2(t,Z,S) == PX2[Z,S]+t*cosd(theta[S])
            println("Der Teil für die X1 Koordinate ist korrekt. Schaut euch für die X2 Koordinaten noch einmal an, wie der Kosinus und Sinus definiert sind.")
        else
            println("Der Teil für die X1 Koordinate ist korrekt. Überprüft erneut eure Formel für die X2 Koordinate.")
        end
    elseif ParameterdarstellungX1(t,Z,S) == PX1[Z,S]+t*sind(theta[S])
        if ParameterdarstellungX2(t,Z,S) == PX2[Z,S]+t*sind(theta[S])
            println("Der Teil für die X2 Koordinate ist korrekt. Schaut euch für die X1 Koordinaten noch einmal an, wie der Kosinus und Sinus definiert sind.")
        else
            println("Schaut euch erneut an, wie der Sinus und Kosinus definiert sind und überprüft erneut eure Formeln.")
        end
    else
        println("Schaut euch erneut an, wie der Sinus und Kosinus definiert sind und überprüft erneut eure Formeln.")
   end                                        
end
