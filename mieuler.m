function [t,u] = mieuler(t0, tfin, N, x0, f, par)
% MÉTODO DE EULER - orden 1
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

%generar t, el mallado de puntos donde vamos a calcular la aproximación
t= t0:h:tfin; % Eq a linspace(t0,tfin,N+1)

%inicializar la variable u como una tabla de ceros (la columna n+1 representa 
%la aproximación de x(tn)), añadiendo el valor inicial
u = [x0, zeros(dim,N)];

% Iteramos N veces
for i=1:N
    u(:,i+1) = u(:,i) + h*f(t(i),u(:,i),par);
end

end

