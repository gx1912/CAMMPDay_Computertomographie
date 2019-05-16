function distance2(x,y,nx,ny,x0,x1,y0,y1,vx,vy)

## set parameter
paramsx0 = x0;
paramsy0 = y0;

paramsx1 = x1;
paramsy1 = y1;

paramsnx = nx;
paramsny = ny;

paramsdx = (paramsx1-paramsx0)/paramsnx;
paramsdy = (paramsy1-paramsy0)/paramsny;

if y >= y1
    y = y1-1e-8;
end
if x >= x1
    x = x1-1e-8;
end

savex = x;
savey = y;

## traverse

i,j,valid = getij2(x, y, paramsx0,paramsy0,paramsx1,paramsy1,paramsdx,paramsdy,paramsnx,paramsny);
I =[]; J = []; L = [];
while (valid)
    if I ==[]
        I = i;
    else
        I = [I;i] ;
    end
    if J ==[]
        J = j;
    else
        J = [J;j] ;
    end
    lasti = i;
    lastj = j;
    northy, eastx, southy, westx = getwallpositions2(i, j, paramsx0,paramsy0,paramsx1,paramsy1,paramsdx,paramsdy,paramsnx,paramsny);
    
    if vx > 0
        if vy > 0
            nexty = southy;
            nextx = eastx;
                else #vy<0
            nexty = northy;
            nextx = eastx;
        end
    else #vx<0
        if vy > 0
            nexty = southy;
            nextx = westx;
    else #vy<0
            nexty = northy;
            nextx = westx;
        end
    end
    
    # get scaled distance to next walls
    disttowallx = (nextx-x)/vx;
    disttowally = (nexty-y)/vy;
    
    if disttowallx == 0
        disttowallx = paramsdx/abs(vx);
    end
    if disttowally == 0
        disttowally = paramsdy/abs(vy);
    end
    
    
    if disttowallx < disttowally
        l = disttowallx;
    else
        l = disttowally;
    end
    l = l + 1e-8;
    
    x = x +l*vx;
    y = y +l*vy;
    if L == []
        L = l;
    else
        L = [L;l];
    end
                                    
    i, j, valid = getij2(x, y, paramsx0,paramsy0,paramsx1,paramsy1,paramsdx,paramsdy,paramsnx,paramsny);
    if valid
        if abs(i-lasti)+abs(j-lastj)==1
        else
            warning("this should not happen!")
            exit()
        end
    end
end
                    
xresult = x;
yresult = y;
                    
return I,J,L,x,y;               

end


 