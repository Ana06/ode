function [t,u] = midisplingen(t0,tfin,N,a,b,pqr,C1,C2)
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
%C1=0 => x(t0) = a, C1=1 => x'(t0) = a, C1=2 => x'(t0)+a(1)x(t0) = a(2)
%C2=0 => x(T) = b, C2=1 => x'(T) = b, C2=2 => x'(T)+b(1)x(T) = b(2)
%
%
%VARIABLES DE SALIDA
%u tabla de valores de x(t)
%t tabla de puntos t(n)

%v''1(t) = p(t)v'1(t) + q(t)v1(t) + r(t);
%v1(t0) = a; v'(t0)=0
%Resolvemos en t € [t0,T]
if C1==2
    x01=[a(2)/a(1);0];
    x02=[-1/a(1);1];
else
    x01=[a*(C1==0);a*(C1==1)];
    x02=[C1;(1-C1)];
end
[t,v1]= mirk4(t0, tfin, N, x01, @fundisplin1, pqr);

%v''2(t) = p(t)v'2(t) + q(t)v2(t)
%v1(t0) = 0; v'(t0)=1
%Resolvemos en t € [t0,T]
[~,v2]= mirk4(t0, tfin, N, x02, @fundisplin2, pqr);

%v(t,s)=v1(t)+sv2(t)=b si C2=0
%v(t,s)=v1'(t)+sv2'(t)=b si C2=1
if C2==2
    cond=v2(2,end)+b(1)*v2(1,end);
    cond2=v1(2,end)+b(1)*v1(1,end);
	b2=b(2)
else
    cond=v2(1+C2,end);
    cond2=v1(1+C2,end);
	b2=b;
end
if cond~=0
    % Despejamos s
    if C2 == 2
        s=(b(2)-v1(2,end)-b(1)*v1(1,end))/(v2(2,end)+b(1)*v2(1,end));
    else
        s=(b-v1(1+C2,end))/v2(1+C2,end);
    end
    u(1,:)= v1(1,:) + s*v2(1,:);
    u(2,:)= v1(2,:) + s*v2(2,:);
elseif cond2 == b2
    error('Tiene infinitas soluciones')
else 
    error('No tiene solución')
end
end

