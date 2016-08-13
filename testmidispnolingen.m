% Colores para las gráficas
colors = ['r','g'];

mispracticas

TOL=0.0001;
[t,u] = midispnolingen(tinic, tfin, N, a, b, ffxfy, C1, C2, TOL);
%[t,u] = midispnolingen(tinic, tfin, N, a, b, ffxfy, C1, C2, TOL,'secante');

figure(1)
for i=1:2
   subplot(2,1,i)
   plot(t,u(i,:),colors(i))
   
end

figure(2)
plot(t,solexacta(t), 'r')
title('Solución exacta')
