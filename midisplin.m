function [t,u] = midisplin(t0,tfin,N,a,b,pqr,C1,C2)
%PROBLEMA DE CONTORNO - DISPARO LINEAL
%
%
%DATOS DE ENTRADA
%t0 tiempo inicial
%tfin tiempo final
%N numero de puntos (N+2)
%a valor contorno en t0
%b valor contorno en tfin
%p(t), q(t), r(t) coeficientes de la EDO: x''(t)=p(t)x'(t)+q(t)x(t)+r(t)
%
%C1=0 C2=0 => x(t0) = a; x(T) = b
%C1=0 C2=1 => x(t0) = a; x'(T) = b
%C1=1 C2=0 => x'(t0) = a; x(T) = b
%C1=1 C2=1 => x'(t0) = a; x'(T) = b
%
%De momento C1 = 0 C2 =0
%
%VARIABLES DE SALIDA
%u tabla de valores de x(t)
%t tabla de puntos t(n)

%v''1(t) = p(t)v'1(t) + q(t)v1(t) + r(t);
%v1(t0) = a; v'(t0)=0
%Resolvemos en t € [t0,T]
[t,v1]= mirk4(t0, tfin, N, [a*(C1==0);a*(C1==1)], @fundisplin1, pqr);

%v''2(t) = p(t)v'2(t) + q(t)v2(t)
%v1(t0) = 0; v'(t0)=1
%Resolvemos en t € [t0,T]
[~,v2]= mirk4(t0, tfin, N, [C1;(1-C1)], @fundisplin2, pqr);

%v(t,s)=v1(t)+sv2(t)=b si C2=0
%v(t,s)=v1'(t)+sv2'(t)=b si C2=1
if v2(1+C2,end)~=0
        s=(b-v1(1+C2,end))/v2(1+C2,end);
        u(1,:)= v1(1,:) + s*v2(1,:);
        u(2,:)= v1(2,:) + s*v2(2,:);
elseif v1(1+C2,end) == b
    error('Tiene infinitas soluciones')
else 
    error('No tiene solución')
end
end

