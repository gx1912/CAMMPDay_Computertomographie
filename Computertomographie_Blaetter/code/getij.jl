function getij(x,y,paramsx0,paramsy0,paramsx1,paramsy1,paramsdx,paramsdy,paramsnx,paramsny)

i=-1; j=-1;
valid = true;
# i / y 
y0 = paramsy0;
for n=1:paramsny

    if y0 <= y && y < y0+paramsdy
        i=n;
        break
    end
    y0 = y0+paramsdy;
end
    
# j / x
x0 = paramsx0;
for n=1:paramsnx
    if x0 <= x && x < x0+paramsdx
        j=n;
        break
    end
    x0 = x0+paramsdx;
end
    
if i==-1 || j==-1
    valid = false;
end

return i,j,valid;    
    
end
