% Colores para las gráficas
colors = ['r','g'];

mispracticas
[t,u]=midisplingen(tinic,tfin,N,a,b,pqr,C1,C2);

for i=1:2
   subplot(2,1,i)
   plot(t,u(i,:),colors(i))
end