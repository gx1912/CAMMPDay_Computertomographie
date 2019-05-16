function erstelleA(x0,x1,y0,y1,N,JJ,nx,ny,verschx,verschy)
# Anzahl der Parallelen muss immer mindestens ein kleiner sein als die Anzahl der Unterteilungen in nx und ny
#x0 = 1;y0 = 1; 
#N = 10;
#JJ = 11;
#nx = 10; ny = 10;
#x1 = x0+nx; y1 = y0+ny;
#verschx = 0.25; # Verschiebung x damit Strahlen nicht auf Kante liegen
#verschy = 0.25; # Verschiebung y damit Strahlen nicht auf Kante liegen


theta1 = 0.00001; # Referenzwinkel
Zeile = 1;
omega = zeros(JJ);
laengenmatrix = zeros(N*JJ,nx*ny);

for i=1:JJ
    theta= theta1+((i-1)/JJ)*pi;
    omega[i] = theta;
    X,Y,Deltas = createStartingPositionsmein2(x0,x1,y0,y1,N,nx,ny,theta,verschx,verschy);
    for k = 1:N
        x = X[k]+1e-8;
        y = Y[k]+1e-8;
        if x <= x1+2e-8 && y <= y1+1e-8
            vx = cos(theta); 
            vy = sin(theta);
            I,J,L,xend,yend = distance2(x,y,nx,ny,x0,x1,y0,y1,vx,vy);
            l=length(L);
            for n = 1:l
                eintrag = LinearIndices((1:ny,1:nx))[Int(I[n,1]),Int(J[n,1])];
                eintrag = Int(eintrag);
                #print(I[n,1])
                #print(J[n,1])
                laengenmatrix[Zeile,eintrag]= L[n,1];
                #print(laengenmatrix)
            end
            Zeile = Zeile+1;
        end
    end
end

return laengenmatrix;
    
end