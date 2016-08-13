function f = funcpendulo(~,x,par)
%par=[beta,g,l,M]
f=[x(2);par(4)-2*par(1)*x(2)-par(2)/par(3)*sin(x(1))];
end

