function ueberpruefeMittelpunkte(PX1,PX2,theta,ParaX1,ParaX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,Abstand,MitteSuSx,MitteSuSy,nx,ny,Pixel)
counterb = 2;
eps = 1e-7;
XWerte = zeros(size(Abstand,1),size(Abstand,2));
YWerte = zeros(size(Abstand,1),size(Abstand,2));
XWertevec = zeros(size(Abstand,1)*size(Abstand,2),1);
YWertevec = zeros(size(Abstand,1)*size(Abstand,2),1);
    
t1(Z,S,k) = (X[k]-PX1[Z,S])/cosd(theta[S]);
t2(Z,S,k) = (Y[k]-PX2[Z,S])/sind(theta[S]);

 SPX1,SPX2,Plot = berechneallgemeineSchnittpunkte(PX1,PX2,theta,ParaX1,ParaX2,a,b,X1,X2,N,JJ,VX1,VX2,HX1,HX2,counterb);

Z1 = 1;
S1 = 1;
Mittex = zeros(size(Abstand,1),size(Abstand,2));
Mittey = zeros(size(Abstand,1),size(Abstand,2));
    
if MitteSuSx(Z1,S1) == SPX1[Z1,S1]+1/2*(SPX1[Z1+1,S1]-SPX1[Z1,S1]) && MitteSuSy(Z1,S1) == SPX2[Z1,S1]+1/2*(SPX2[Z1+1,S1]-SPX2[Z1,S1])
    Mittex(Z,S) = SPX1[Z,S]+1/2*(SPX1[Z+1,S]-SPX1[Z,S]);
    Mittey(Z,S) = SPX2[Z,S]+1/2*(SPX2[Z+1,S]-SPX2[Z,S]);

veccounter = 1;
        for m = 1:JJ# Anzahl Winkel
            for Spalte = m*N-(N-1):m*N
                    counter = 1;
                    for Zeile = 1:size(Abstand,1)
                        if almostequal(Abstand[Zeile,Spalte], 0)
                        else
                            if (Mittex(Zeile,Spalte) >= a-eps) && (Mittex(Zeile,Spalte) <= b+eps) && (Mittey(Zeile,Spalte) >= a-eps) && (Mittey(Zeile,Spalte) <= b+eps) 
                                XWerte[counter,Spalte] = Mittex(Zeile,Spalte);
                                YWerte[counter,Spalte] = Mittey(Zeile,Spalte);
                                XWertevec[veccounter] = Mittex(Zeile,Spalte);
                                YWertevec[veccounter] = Mittey(Zeile,Spalte);
                                veccounter = veccounter+1;
                                counter = counter+1;
                            end
                        end
                    end
            end
        end
        scatter!(XWertevec,YWertevec,markersize=3,markercolor=:cyan);
        scatter!(Pixel[:,2],Pixel[:,3],markersize=3,markercolor=:yellow);
else
    println("Überprüft erneut eure Formeln.")
    XWerte = [];
    YWerte = [];
end

print("MPX1: ");                    
show(stdout,"text/plain",XWerte);
print("\n\n MPX2: ");  
show(stdout,"text/plain",YWerte);
display(Plot);
            
return XWerte, YWerte;
            
end