function [t,u] = midispnolin(t0, T, N, a, b, ffxfy, C1, C2, TOL, m)
%PROBLEMA DE CONTORNO - DISPARO LINEAL
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
%C1=0 C2=1 => x0(t0) = a; x(T) = b
%C1=1 C2=0 => x(t0) = a; x0(T) = b
%C1=1 C2=1 => x0(t0) = a; x0(T) = b
%
%VARIABLES DE SALIDA
%u tabla de valores de x(t)
%t tabla de puntos t(n)

%s_k+1=s_k-(v(T,s_k)-b)/z(T,s_k)
%v'(t)=w(t)                                         v(t0)=a
%w'(t)=f(t,v(t),w(t))                               w(t0)=s_k
%z'(t)=u(t)                                         z(t0)=0
%u'(t)=dyf(t,v(t),w(t))u(t)+dxf(t,v(t),w(t))z(t)    u(t0)=1
%dx-derivada respecto de x

if nargin==9
   m='newton';
end

    F = Inf; 
    s = (b-a)/(T-t0);
if strcmp(m,'newton')
%     %Error cometido: F = x(T,s)-b
    while abs(F) > TOL
       [t,v] = mirk4(t0,T,N, [a;s;0;1]*(C1==0) + [s;a;1;0]*(C1==1), @funcdispnolin, ffxfy); 
       F = v(1+C2, end)-b;
       s = s - F/v(3+C2, end);
    end
    
elseif strcmp(m,'secante')
    ss= Inf;
    while abs(F) > TOL
       [t,v] = mirk4(t0,T,N, [a;s;0;1]*(C1<1) + [s;a;1;0]*(C1>0), @funcdispnolin, ffxfy); 
       Faux=F;
       F = v(1+C2, end)-b;
       if ss==Inf %Primera iteración - inicialización de s1
           ss=s;
           s = s+(b-v(1+C2, end))/(T-t0);
       else
           sAux=s;
           s = sAux - F/(F-Faux)*(sAux-ss);
           ss=sAux;
       end
    end
end

% Construímos la solución del PCL (tb nos llevamos su derivada)
u = v(1:2,:);

end


