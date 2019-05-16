function ueberpruefePixel(Pixel,PX1,PX2,theta,ParameterdarstellungX1,ParameterdarstellungX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,x0,x1,y0,y1,nx,ny)
counter = 2;
    
n, Pixelx, Pixely = Pixelberechner(x0,x1,y0,y1,nx,ny);
pixelkorrekt = hcat(n,Pixelx,Pixely);
if almostequal(Pixel, pixelkorrekt)
    println("Eure Pixelmittelpunkte sind korrekt!")
    t1(Z,S,k) = (X[k]-StartpunktXWerte[Z,S])/cosd(Winkel[S]);
    t2(Z,S,k) = (Y[k]-StartpunktYWerte[Z,S])/sind(Winkel[S]);

    SPX1,SPX2,Plot = berechneallgemeineSchnittpunkte(PX1,PX2,theta,ParameterdarstellungX1,ParameterdarstellungX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,counter);
    scatter!(Pixel[:,2],Pixel[:,3],markersize=3,markercolor=:yellow);
else
    println("Schaut euch noch einmal die Reihenfolge der Pixel an und überprüft die eingegeben Werte.")
end


#axis equal
#grid on
return Plot;
end
