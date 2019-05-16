function ueberpruefeFormel(Formel,Aufloesung)
#save(File(format"JLD","SuS/AB3.ipynb"));
Phantom = echteCTDaten(Aufloesung);
nrows,ncols = size(Phantom);
PhantomVec = reshape(Phantom,(Int(nrows)*Int(ncols),1));

if Aufloesung != 2 && Aufloesung != 4 && Aufloesung != 8 && Aufloesung != 16 && Aufloesung != 32 && Aufloesung != 64 && Aufloesung != 128 && Aufloesung != 256 && Aufloesung != 512  
    error("Die Aufloesung darf nur zwischen 3 und 100 liegen.")
end 

x0,y0,N,JJ,nx,ny,x1,y1,verschx,verschy,a,b,A,theta1,counter = Dateneinlesen(Aufloesung);
A2 = MartinStrahlen(Aufloesung,x0,x1,y0,y1,N,JJ,nx,ny,verschx,verschy);
Messwerte =  A2*PhantomVec;

Arows,Acols = size(A2);
f_nah = zeros(Int(Acols),1).+1;

if almostequal(Formel(A2,f_nah,Messwerte),norm(A2*f_nah-Messwerte)^2)
    println("Eure Formel für den Abstand ist korrekt!");
elseif almostequal(Formel(A2,f_nah,Messwerte),norm(A2*f_nah-Messwerte))
    println("Eure Formel ist noch nicht ganz korrekt. Da ihr hier einen Abstand berechnet und eigentliche dadurch eine Wurzel beim auflösen der Formel auftritt, quadriert man die rechte Seite.");
elseif almostequal(Formel(A2,f_nah,Messwerte),A2*f_nah-Messwerte)
    println("Eure Formel ist noch nicht ganz korrekt. Ihr müsst den Abstand zwischen den beiden Vektoren bestimmen.");
else
    println("Eure Formel stimmt noch nicht.");
end
Schritt = 1.1;                
return  Messwerte,A2,PhantomVec,Arows,Acols,Schritt;

end