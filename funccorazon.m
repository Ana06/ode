function f = funccorazon(t,x,~) 
%La ecuación del corazón
%x1'=x2
%x2'=-16x1+4sen(2t)=f(t,x1,x2)
f=[x(2); -16*x(1)+4*sin(2*t)];
end
