function [t,u] = mirk4(t0, tfin, N, x0, f, par)
% MÉTODO RUNGE-KUTTA - orden 4
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
% utabla de valores de x(t(n))

dim = size(x0,1);

%definir el paso h;
h= (tfin-t0)/N;

%generar t, el mallado de puntos donde vamos a calcular la aproximación
t= t0:h:tfin;

%inicializar la variable u como una tabla de ceros, (la columna n+1 representa 
%la aproximación de x(tn))
u = [x0,zeros(dim,N)];

% Definimos el tablero
c = [0 1/2 1/2 1];
A = [0  0   0   0; 
    1/2 0   0   0;
    0   1/2 0   0; 
    0   0   1   0];
b = [1/6 2/6 2/6 1/6];

% Inicializamos K = [K1;K2;K3;K4]
K=zeros(dim,4);

% Iteramos N veces
for i=1:N
    
    % Obtenemos los K
   for j=1:4
        K(:,j)=f(t(i)+c(j)*h,u(:,i)+h*K*A(j,:)',par);
   end

   u(:,i+1)=u(:,i)+h*K*b';
end

       

       
       