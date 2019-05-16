function Pixelberechner(x0,x1,y0,y1,nx,ny)
n = zeros(nx*ny,1);
Pixelx = zeros(nx*ny,1);
Pixely = zeros(nx*ny,1);
    
deltax = (x1-x0)/(2*nx); # Verschiebung, um zur x-Mitte des Pixels zu gelangen
deltay = (y1-y0)/(2*ny); # Verschiebung, um zur y-Mitte des Pixels zu gelangen
counter = 1;
for i = 1:ny # damit spaltenweise Pixel nummeriert werden
    for k = 1:ny
        n[counter,1] = counter;
        Pixelx[counter] = x0+i-deltax;
        Pixely[counter] = y1-k+deltay;
        counter = counter+1; 
    end 
end
return n, Pixelx, Pixely;
end