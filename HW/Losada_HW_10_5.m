clear,clc,format short g
r=1;rhos=250;rhow=1000;
fh=@(h) 4/3*r^3*pi*(rhow-rhos)-rhow*pi*h.^2/3.*(3*r-h);
h=[0:2*r/20:2*r];fhh=fh(h);
[height f ea iter]=bisect(fh,0,2*r)