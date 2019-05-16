function MartinStrahlen(Dim,x0,x1,y0,y1,N,JJ,nx,ny,verschx,verschy)

laengenmatrix = zeros(1,nx*ny);
theta1 = 0.00001; #Referenzwinkel
Nullzeile = 1;
alpha = zeros(JJ,1);

for i=1:JJ
    theta= theta1+((i-1)/JJ)*pi;
    #omega[i] = theta;
    alpha[i] = theta*180/pi;
    X,Y,Deltas = createStartingPositionsmeinsneu(x0,x1,y0,y1,N,nx,ny,theta,verschx,verschy);
    vx = cos(theta);
    vy = sin(theta);
    laengenmatrixTeil, SchnittVektorsort,Nullzeile = Schnittpunkte(Dim,i,X,Y,x0,y0,x1,y1,N,JJ,nx,ny,vx,vy,theta,Nullzeile);
    if laengenmatrix == zeros(1,nx*ny)
        laengenmatrix = laengenmatrixTeil;
    else
        laengenmatrix = [laengenmatrix; laengenmatrixTeil];
    end
end
return laengenmatrix;
end