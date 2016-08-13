
% Uncomment the function you want to use


% INITIAL VALUE PROBLEMS

% Cardioid
% fun=@funccorazon; x0 = [0; 2]; tinic = 0; tfin = 2*pi; N = 80; par=[];

% Van der Pol oscillator 
% fun = @funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; N=1000; par=[]; jac=@jacvanderpol; itmax=10;

% Rigid equation, better for trapezoidal than rk4
% fun = @funcrigida; x0=0; tinic=0; tfin=pi/2; N=100; par=[]; jac=@jacrigida; itmax=10;

% Pendulum par=[beta,g,l,M]
% Example1 beta=0,0.25,1.5 g=9.8 l=1 M=0   Si beta =0 el pendulo oscila y nunca se para
% Example2 beta=0.5 g=9.8 l=1 M=9.7,9.8,9.9   Si M(fuerza) > g(gravedad) la velocidad siempre es positiva
% fun=@funcpendulo; x0 = [pi/2;0.1]; tinic=0; tfin=100; N=1000; par=[0,9.8,1,0]; 

% Lineal pendulum
% fun=@funcpendulolin; x0 = [pi/2;0.1]; tinic=0; tfin=100; N=10000; par=[1.5,9.8,1,0]; %par=[beta,g,l,M]


% LINEAR BOUNDARY VALUE PROBLEMS

% pqr={@(t) 0, @(t) 4, @(t) -4*t}; tinic=0;tfin=1; N=1000; a=0; b=2; C1=0; C2=0; %4(x(t)-t)

% pqr={@(t) 3, @(t) 2, @(t) 3*cos(t)}; tinic=0;tfin=5; N=1000; a=-2; b=1; C1=0; C2=1; %3x'(t)+2x(t)+3cos(t)

% pqr={@(t) cos(t), @(t) 0, @(t) t}; tinic=0;tfin=10; N=1000; a=-2; b=-1; C1=1; C2=0; %cos(t)x(t)+t

% pqr={@(t) 1-sin(t), @(t) cos(t), @(t) sin(t)}; tinic=0;tfin=10; N=1000; a=-2; b=-1; C1=1; C2=1; %(1-sen(t))x'(t)+cos(t)x(t)+sen(t)

% pqr={@(t) 0, @(t) 4, @(t) -4*t}; tinic=0;tfin=1; N=1000; a=[1,0]; b=[2,2]; C1=2; C2=2; %4(x(t)-t)


% NONLINEAR BOUNDARY VALUE PROBLEMS

% ffxfy={@(t,x,y) 2*x^3, @(t,x,y) 6*x^2, @(t,x,y) 0 };tinic = 1; tfin = 2;N=1000;a=1/2;b=1/3; C1=0;C2=0; solexacta = @(t) 1./(1+t); %x''(t)=2*x(t)^3

% ffxfy={@(t,x,y) 8*x^3, @(t,x,y) 24*x^2, @(t,x,y) 0 };tinic = 0; tfin = 1;N= 1000;a=1/3;b=2; C1=0;C2=1; solexacta = @(t) 1./(3-2*t); %x''(t)=8*x(t)^3

% ffxfy={@(t,x,y) (-t*y+x+t)^3+1/t, @(t,x,y) 3*(-t*y+x+t), @(t,x,y) -6*t*(-t*y+x+t)^2 };tinic = 1; tfin = exp(1);N= 1000;a=1;b=2; C1=1;C2=1; solexacta = @(t) t.*log(t); %x''(t)=(-tx'(t)+x(t)+t)^3 + 1/t

% ffxfy={@(t,x,y) -y^2+x+t, @(t,x,y) 1, @(t,x,y) -2*y};tinic=1;tfin=2;a=0;b=2;N=1000;C1=1;C2=1; %x''(t)=-x'(t)^2+x(t)+t

% ffxfy={@(t,x,y) (2*sin(t^2)+8*t^2)*x-4*t^2*x*log(x)+2*t*sin(t^2)*y,@(t,x,y) 2*sin(t^2)+8*t^2-4*t^2*(log(x)+1), @(t,x,y) 2*t*sin(t^2) };tinic= 0; tfin = sqrt(10.5*pi); N = 1000;a=exp(1);b=exp(2); solexacta = @(t) exp(repmat(2,1,N+1)-cos(t.^2));C1=0;C2=0; %x''(t)=

% ffxfy={@(t,x,y) 2*x^3, @(t,x,y) 6*x^2, @(t,x,y) 0 };tinic = 1; tfin = 2;N=1000;a=[1,1/2];b=[1/3, 1]; C1=2;C2=2; solexacta = @(t) 1./(1+t); %x''(t)=2*x(t)^3

