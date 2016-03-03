function f = funcvanderpol(~,x,~)
%x''(t)+(x^2(t)-1)x'(t)+x(t)=0
%x2'(t)= -(x(1)^2(t)-1)x(2)(t)-x(t)
%x1'(t)=x2(t)
f = [x(2);-(x(1)^2-1)*x(2)-x(1)];
end
