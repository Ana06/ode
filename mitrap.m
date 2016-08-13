function [t,u,numfun] = mitrap(t0, tfin, N, x0, f, par, jac, itmax)
% MÉTODO DEL TRAPECIO - orden 2
%
% DATOS DE ENTRADA
% t0 tiempo inicial
% tfin tiempo final T
% N numero de pasos
% x0 valor inicial, vector columna
% f(t,x) funcion de la E.D.O.
% p puede ser una variable de entrada con parametros,se incorpora al final de los 
% datos de entrada, y si no los hay se define como una variable vacia par = []
% jac es el nombre del fichero con el jacobiano de f
% itmax nº máximo de iteraciones en el método de Newton
%
% DATOS DE SALIDA
% t vector fila de tiempos t(n)
% u tabla de valores de x(t(n))
% numfun contador del número de evaluaciones de la función

dim = size(x0,1);

%Inicializar contador numfun=0
numfun=0;

%definir el paso h;
h= (tfin-t0)/N;

%generar t, el mallado de puntos donde vamos a calcular la aproximación
t= t0:h:tfin;

%inicializar la variable u como una tabla de ceros, (la columna n+1 representa 
%la aproximación de x(tn))
u = [x0,zeros(dim,N)];

for i=1:N
	% Newton para resolver la ec implícita
	%Calcular Gn(Zi) G(Z)=Z-F(Z)
	G = z - (u(:,i) + h/2*f(t(i),u(:,i),par))-h/2*f(t(i)+h,z,par);
	%Calcular DGn(Zi)=I-h/2Dxf(ti+1,Zi)
	DG = eye(dim) - h/2*jac(t(i),z,par);
	numfun = numfun + 2;
	%Calcular el error DGn(Zi)W = Gn(Zi)
	w = DG \ G;
	%Inicializar numero de iteraciones
	it = 1;
	while norm(w, inf) >= h^3 && it < itmax
		z = z-w;
		%Calcular Gn(Zi) G(Z)=Z-F(Z)
		G = z - (u(:,i) + h/2*f(t(i),u(:,i),par))-h/2*f(t(i)+h,z,par);
		%Calcular DGn(Zi)=I-h/2Dxf(ti+1,Zi)
		DG = eye(dim) - h/2*jac(t(i),z,par);
		numfun = numfun + 2;
		%Calcular el error DGn(Zi)W = Gn(Zi)
		w = DG \ G;
		it = it+1;
	end
	z = z-w;
	% Ahora ya tenemos una buena aproximación z = x(t_n+1)
	u(:,i+1) = u(:,i) + h/2*f(t(i),u(:,i),par) + h/2*f(t(i+1),z,par);
	z = u(:,i+1); % Para la siguiente iteración
end
end



