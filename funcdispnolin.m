function dx = funcdispnolin(t, x, ffxfy)
dx(1) = x(2);
dx(2) = ffxfy{1}(t,x(1),x(2));
dx(3) = x(4);
dx(4) = ffxfy{3}(t,x(1),x(2))*x(4) + ffxfy{2}(t,x(1),x(2))*x(3);
end