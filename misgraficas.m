% Colores para las gráficas
colors = ['r','g','b'];

%Dimensiones
dim = size(x0,1);

if dim > 3
    disp('Sólo se pintan hasta 3 dimensiones'), return;
end

%Pintamos la gráfica de cada una de las componentes en una misma pantalla
figure(1)
for i=1:dim
   subplot(dim,1,i)
   plot(t,u(i,:),colors(i))
   title(['Solucion ',num2str(i),'-esima'])
   legend(['u_',num2str(i)])
end

pause(1);

if dim > 1
    figure(2)
    switch dim
        case 2
            plot(u(1,:),u(2,:),'r')
        case 3
            plot3(u(1,:),u(2,:),u(3,:),'r')
    end
    title('Diagrama de fases')
end