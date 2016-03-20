function [t,u,H,ERROR,rechazo] = mimetadap(t0, tfin, x0, l0,hmin, TOL, metodo, orden, f, par)
% MÉTODO ADAPTATIVO - con un método monopaso y estimación del error en dos
% pasos sucesivos
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

rechazo =0;
l=l0;
ERROR=[];
H=[];

%Inicializamos t
t(1) = t0;

%inicializar la variable u como una tabla de ceros (la columna n+1 representa 
%la aproximación de x(tn)), añadiendo el valor inicial
u(:,1) = x0;

%Iteramos
i=1;

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

    %Calculamos el valor tentativo
    [~,x]=metodo(t(i), tten, 1, u(:,i), f, par);

    %Calculamos el valor con dos pasos para estimar el error
    [~,xx]=metodo(t(i), tten, 2, u(:,i), f, par);

    %Estimamos el error (resta en valor absoluto / l)
    ERR= norm(x(:,2)-xx(:,3))/l;
    ERROR=[ERROR, ERR];
    
    if ERR <= TOL
        t(i+1)=tten;
        H(i)=l;
        u(:,i+1)=x(:,2);
        i = i+1;
    elseif l < hmin
        error('Paso demasiado pequeño')
    else
        rechazo=rechazo+1;
    end
    l=min(hmax,l*min(facmax,fac*((TOL/ERR)^(1/orden))));
end
end
