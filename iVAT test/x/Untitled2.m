 x = [5 20 40 60 80 100 120];
 y = [-0.2 -0.36 -0.26 -0.24 -0.33 -0.41 -0.55];
 y1 = [-0.15 -0.31 -0.21 -0.19 -0.28 -0.36 -0.5];
 y2 = [-0.25 -0.41 -0.31 -0.29 -0.38 -0.46 -0.6];
 plot(x,y);
 hold on;
 plot(x,y1);
 hold on;
 plot(x,y2);

 
z=-(17*x.^2-16*y.*abs(x)+17.*y.^2);
[c,h]=contourf(z,100);
set(h,'linestyle','none')