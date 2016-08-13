function [t,u] = midispnolingen(t0, T, N, a, b, ffxfy, C1, C2, TOL, m)
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
%C1=0 => x(t0) = a
%C1=1 => x0(t0) = a
%C1=2 => x0(t0) + a(1)*x(t0) = a(2)
%C2=0 => x(T) = b
%C2=1 => x0(T) = b
%C2=2 => x0(T) + b(1)*x(T) = b(2)
%
%
%VARIABLES DE SALIDA
%u tabla de valores de x(t)
%t tabla de puntos t(n)

if nargin==9
   m='newton';
end

    if C1 == 2
        a2=a(2);
    else
        a2=a;
    end
    if C2 == 2
        b2=b(2);
    else
        b2=b;
    end
    F = Inf; 
    s = (b2-a2)/(T-t0);
    
if strcmp(m,'newton')
    while abs(F) > TOL
       if C1==2
           v0=[(a(2)-s)/a(1);s;-1/a(1);1];
       else
           v0=[a;s;0;1]*(C1==0) + [s;a;1;0]*(C1==1);
       end
       [t,v] = mirk4(t0,T,N, v0, @funcdispnolin, ffxfy); 
       if C2 == 2
            F = v(2,end)+b(1)*v(1,end)-b(2);
            Fds = v(4,end)+b(1)*v(3,end);
       else
            F = v(1+C2, end)-b(2);
            Fds = v(3+C2, end);
       end
       s = s - F/Fds;
    end
    
elseif strcmp(m,'secante')
    ss= Inf;
    while abs(F) > TOL
       if C1 == 2
          v0= [(a(2)-s)/a(1);s;-1/a(1);1];
       else
          v0=[a;s;0;1]*(C1==0) + [s;a;1;0]*(C1==1);
       end
       [t,v] = mirk4(t0, T ,N ,v0 , @funcdispnolin, ffxfy); 
       Faux=F;
       if C2 == 2
            F = v(2,end)+b(1)*v(1,end)-b(2);
       else
            F = v(1+C2, end)-b;
       end
       if ss==Inf %Primera iteración - inicialización de s1
           ss=s;
           s = s-F/(T-t0);
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


