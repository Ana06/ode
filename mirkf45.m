function [t,u,H,ERROR,rechazo] = mirkf45(t0, tfin, x0, l0,hmin, TOL, f, par)
% MÉTODO DE RUNGE-KUTTA-FEHLBERG - método interno de orden 4 y método
% externo de orden 5
%
% DATOS DE ENTRADA
% t0 tiempo inicial
% tfin tiempo final T
% x0 valor inicial, vector columna
% l paso inicial
% hmin paso minimo (por ejemplo hmin=10^{-5})
% TOL tolerancia para el error local (por ejemplo 10^{-3})
% metodo método a utilizar
% orden orden del método
% f(t,x) funcion de la E.D.O.
% par puede ser una variable de entrada con parametros,se incorpora al final de los 
% datos de entrada, y si no los hay se define como una variable vacia par = []
%
% DATOS DE SALIDA
% t vector fila de tiempos t(n)
% u tabla de valores de x(t(n))
% H un vector fila de pasos
% ERROR un vector fila de errores
% rechazo el numero de veces que se rechaza el calculo

hmax = (tfin-t0)/10; % Por ejemplo
fac = 0.9; % Factor de seguridad
facmax = 5; % Factor de contracción/dilatación

% Generamos el tablero, a y c son iguales para los dos métodos (pues es el
% método de los pares encajados)
A = [ 0 0 0 0 0 0;
      1/4 0 0 0 0 0;
      3/32 9/32 0 0 0 0;
      1932/2197 -7200/2197 7296/2197 0 0 0;
      439/216 -8 3680/513 -845/4104 0 0;
      -8/27 2 -3544/2565 1859/4104 -11/40 0];
  
b_int = [25/216 0 1408/2565 2197/4104 -1/5 0];

b_ext = [16/135 0 6656/12825 28561/56430 -9/50 2/55];

c= [ 0;
    1/4;
    3/8;
    12/13;
    1;
    1/2];

%INICIALIZACIONES
dim=size(x0,1);
rechazo =0;
l=l0; %h
ERROR=[];
H=[];
K = zeros(dim,6);
%Inicializamos t
t(1) = t0;
%inicializar la variable u como una tabla de ceros (la columna n+1 representa 
%la aproximación de x(tn)), añadiendo el valor inicial
u(:,1) = x0;
%Iteramos
i=1; %n

while t(i)<tfin
    %Calculamos el nodo tentativo
    tten= t(i)+l;
    if tten>tfin
        tten=tfin;
        l=tfin-t(i);
    end
    
    %if tten > tfin
        %break;
    %end

    
    for j=1:6
        K(:,j)=f(t(i)+c(j)*l,u(:,i)+l*K*A(j,:)',par);
   end

    %Estimamos el error (resta en valor absoluto / l)
    ERR = norm((b_int - b_ext)*K');
    ERROR=[ERROR, ERR];
    
    if ERR <= TOL
        t(i+1)=tten;
        H(i)=l;
        u(:,i+1)=u(:,i)+l*K*b_int';
        i = i+1;
    elseif l < hmin
        error('Paso demasiado pequeño')
    else
        rechazo=rechazo+1;
    end
    l=min(hmax,l*min(facmax,fac*((TOL/ERR)^(1/4))));
end
end
