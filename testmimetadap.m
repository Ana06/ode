mispracticas
l = (tfin-tinic)/N;
hmin = 10^(-3);
TOL = 10^(-5);
metodo = @mirk4;
orden = 4;
[t,u,H,ERROR,rechazo]=mimetadap(tinic, tfin, x0, l,hmin, TOL, metodo, orden, fun, par);
misgraficas
figure(3)
plot(t(1:(size(t,2)-1)),H,'r')
title('Pasos utilizados')
