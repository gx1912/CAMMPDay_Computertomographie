function createStartingPositionsmein(x0,x1,y0,y1,N,nx,ny,alpha,verschx,verschy)
X = [];
Y = [];
ALPHA = [];
eps = 0.0000001;
unten = 0;
oben = 0;

xmid = (x0+x1)/2-verschx; 
ymid = (y0+y1)/2+verschy;

    if (mod(N,2) == 0)
        unten = N/2;
        oben = (N/2)-1;
    else
        unten = (N-1)/2;
        oben = (N-1)/2;
    end
        
Deltas = -unten:1:oben;
nRaysPerAngle = length(Deltas);
omega = [cos(alpha),sin(alpha)];
omegaPerp = [-sin(alpha),cos(alpha)];
mycolor = rand(1,3);
    
    for j = 1:nRaysPerAngle
        
        delta = Deltas[j];
        
        x = xmid+delta*omegaPerp[1];
        y = ymid+delta*omegaPerp[2];
        vx = -cos(alpha); 
        vy = -sin(alpha);
        I,J,L,xresult,yresult = distance(x,y,nx,ny,x0,x1,y0,y1,vx,vy);
        
        X = [X;xresult];
        Y = [Y;yresult];
    end

return X,Y,Deltas;
            
end
