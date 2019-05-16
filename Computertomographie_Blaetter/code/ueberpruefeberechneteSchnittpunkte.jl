function ueberpruefeberechneteSchnittpunkte(Sx1,Sy1,Sx2,Sy2,x0,y0,N, JJ,nx,ny,x1,y1,theta,X,Y)

vx = cosd(theta);
vy = sind(theta);
Dim = nx;
Winkel = 1;
Nullzeile = 0;
theta = theta*pi/180;
laengenmatrix, SchnittVektorsort,Nullzeile = Schnittpunkte(Dim,Winkel,X,Y,x0,y0,x1,y1,N,JJ,nx,ny,vx,vy,theta,Nullzeile);

if almostequal(Sx1,round(SchnittVektorsort[2,1];digits=2)) && almostequal(Sy1,round(SchnittVektorsort[2,2];digits=2))
    println("Ihr habt den ersten Schnittpunkt korrekt berechnet!")
else
    println("Euer erster Schnittpunkt stimmt noch nicht.")
end
if almostequal(Sx2,round(SchnittVektorsort[3,1];digits=2)) && almostequal(Sy2,round(SchnittVektorsort[3,2];digits=2))
    println("Ihr habt den zweiten Schnittpunkt korrekt berechnet!")
else
    println("Euer zweiter Schnittpunkt stimmt noch nicht.")
end

end