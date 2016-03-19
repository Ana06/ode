function [t,u] = mimilsimp(t0, tfin, N, x0, f, par)
% M�TODO DE PREDICCI�N CORRECCI�N
% Predictor: M�todo de Milne de 4 pasos 
% Corrector:M�todo de Simpson de 2 pasos
%
%Las oscilaciones que manifestaba el m�todo de Milne se ven eliminadas en
%este m�todo
%
% DATOS DE ENTRADA
% t0 tiempo inicial
% tfin tiempo final T
% N numero de pasos
% x0 valor inicial, vector columna
% f(t,x) funcion de la E.D.O.
% p puede ser una variable de entrada con parametros,se incorpora al final de los 
% datos de entrada, y si no los hay se define como una variable vacia par = []
%
% DATOS DE SALIDA
% t vector fila de tiempos t(n)
% u tabla de valores de x(t(n))

dim = size(x0,1);

%definir el paso h;
h= (tfin-t0)/N;

%generar t, el mallado de puntos donde vamos a calcular la aproximaci�n
t= t0:h:tfin; % Eq a linspace(t0,tfin,N+1)

%Calcular los x1, x2 y x3 con un m�todo monopaso al menos de orden 3, como
%mirk4 que es de orden 4
[~,x]= mirk4(t0, t(4), 3, x0, f, par);

%inicializar la variable u como una tabla de ceros (la columna n+1 representa 
%la aproximaci�n de x(tn)), a�adiendo los valores iniciales
u = [x0, x(:,2), x(:,3), x(:,4), zeros(dim,N-3)];

% Guardaremos evaluaciones de f para no repetir calculos
fi = zeros(dim,N);

for i=1:3
    fi(:,i) = f(t(i),u(:,i),par);
end

for i=4:N
%PREDICTOR. Inicializar z0. Inicializado con un m�todo expl�cito o el de la it.
%anterior. En este caso inicializado con Milne de 4 pasos.
fi(:,i)= f(t(i),u(:,i),par); %Para no repetir c�lculos
u(:,i+1) = u(:,i-3) + 4*h/3*(2*f(t(i),u(:,i),par)-f(t(i-1),u(:,i-1),par)+2*f(t(i-2),u(:,i-2),par));

%CORRECTOR Iterar hasta obtener Zj+1, normalmente J=0
u(:,i+1)= u(:,i-1)+h/3*(f(t(i+1),u(:,i+1),par)+4*fi(:,i)+fi(:,i-1));
end

end

