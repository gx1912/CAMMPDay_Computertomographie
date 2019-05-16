function createStartingPositionsmeinsneu(x0,x1,y0,y1,N,nx,ny,alpha,verschx,verschy)
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
x = 0;
y = 0;
r = 0;
s = 0;
t = 0;
xStart = [];
yStart = [];
    
    for j = 1:nRaysPerAngle
        
        delta = Deltas[j];
        
        x = xmid+delta*omegaPerp[1];
        y = ymid+delta*omegaPerp[2];
        
            r = (x0-x)/cos(alpha);

            if y+r*sin(alpha) < y0-eps || y+r*sin(alpha) > y1+eps
                s = (y0-y)/sin(alpha);
                if x+s*cos(alpha) < x0-eps || x+s*cos(alpha) > x1+eps
                    t = (x1-x)/cos(alpha);
                    if y+t*sin(alpha) < y0-eps || y+t*sin(alpha) > y1+eps
                        xStart = [];
                        yStart = [];
                    else
                        xStart = x1;
                        yStart = y+t*sin(alpha);
                    end
                else
                    xStart = x+s*cos(alpha);
                    yStart = y0;
                end
            else
                xStart = x0;
                yStart = y+r*sin(alpha);
            end

        X = [X;xStart];
        Y = [Y;yStart];
    end
                        
return X,Y,Deltas;
                        
end
