function Startpunkte(x0,y0,N, JJ,nx,ny,x1,y1,verschx,verschy,theta1,counter)
# format shortg
alpha = zeros(1,JJ);
vx = zeros(1,JJ);
vy = zeros(1,JJ);
AlleX = [];
AlleY = [];
for i = 1:JJ
    theta = theta1+((i-1)/JJ)*pi;
    alpha[i] = round(theta*180/pi;digits=4);
    X,Y,Deltas = createStartingPositionsmein(x0,x1,y0,y1,N,nx,ny,theta,verschx,verschy);
    if counter == 1
        AlleX = X;#round(X;digits=4);
        AlleY = Y;#round(Y;digits=4);
    else
        AlleX = [AlleX X];#round(X;digits=4)];
        AlleY = [AlleY Y];#round(Y;digits=4)];
    end
    vx[i] = cos(theta);
    vy[i] = sin(theta);
    counter = counter+1;
end
return alpha,AlleX,AlleY;
end