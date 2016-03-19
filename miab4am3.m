function [t,u] = miab4am3(t0, tfin, N, x0, f, par)
% MÉTODO DE PREDICCIÓN CORRECCIÓN
% Predictor: Método de Adams-Bashforth de 4 pasos  El order del predictor
% interesa que tenga orden mayor o igual al del corrector -1
% Corrector:Método de Adams-Moulton de 3 pasos
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

%Calcular los x1, x2 y x3 con un método monopaso al menos de orden 3, como
%mirk4 que es de orden 4
[~,x]= mirk4(t0, t(4), 3, x0, f, par);

%inicializar la variable u como una tabla de ceros (la columna n+1 representa 
%la aproximación de x(tn)), añadiendo los valores iniciales
u = [x0, x(:,2), x(:,3), x(:,4), zeros(dim,N-3)];

% Guardaremos evaluaciones de f para no repetir calculos
fi = zeros(dim,N);

for i=1:3
    fi(:,i) = f(t(i),u(:,i),par);
end

for i=4:N
%PREDICTOR. Inicializar z0. Inicializado con un método explícito o el de la it.
%anterior. En este caso inicializado con Adams-Bashforth de 4 pasos.
fi(:,i)= f(t(i),u(:,i),par); %Para no repetir cálculos
u(:,i+1) = u(:,i) + h/24*(55*fi(:,i)-59*fi(:,i-1)+37*fi(:,i-2)-9*fi(:,i-3));


%CORRECTOR Iterar hasta obtener Zj+1, normalmente J=0
u(:,i+1)= u(:,i)+h/24*(9*f(t(i+1),u(:,i+1),par)+19*fi(:,i)-5*fi(:,i-1)+fi(:,i-2));

end

