function [t,u] = mieulertr(t0, tfin, N, x0, f, par)
% M�TODO DE PREDICCI�N CORRECCI�N
% Predictor: M�todo de Euler 
% Corrector:M�todo del trapecio
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

%Por si quisi�semos pasarle el n�mero de iteraciones
%if nargin==6
   % numit=1;
%end

dim = size(x0,1);

%definir el paso h;
h= (tfin-t0)/N;

%generar t, el mallado de puntos donde vamos a calcular la aproximaci�n
t= t0:h:tfin; % Eq a linspace(t0,tfin,N+1)

%inicializar la variable u como una tabla de ceros (la columna n+1 representa 
%la aproximaci�n de x(tn)), a�adiendo el valor inicial
u = [x0, zeros(dim,N)];

for i=1:N
%PREDICTOR. Inicializar z0. Inicializado con un m�todo expl�cito o el de la it.
%anterior. En este caso inicializado con Euler.
fi = f(t(i),u(:,i),par); %fi calculada antes para no repetir el c�lculo
u(:,i+1)=u(:,i)+h*fi;

%CORRECTOR Iterar hasta obtener Zj+1, normalmente J=0
u(:,i+1)= u(:,i)+h/2*fi+h/2*f(t(i+1),u(:,i+1),par);
end

