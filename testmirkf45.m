mispracticas
l = (tfin-tinic)/N;
hmin = 10^(-3);
TOL = 10^(-5);
[t,u,H,ERROR,rechazo]=mirkf45(tinic, tfin, x0, l,hmin, TOL, fun, par);
misgraficas
figure(3)
plot(t(1:(size(t,2)-1)),H,'r')
title('Pasos utilizados')
