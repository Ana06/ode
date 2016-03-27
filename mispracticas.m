
% Uncomment the function you want to use


% INITIAL VALUE PROBLEMS

% Cardioid
% fun=@funccorazon; x0 = [0; 2]; tinic = 0; tfin = 2*pi; N = 80; par=[];

% Van der Pol oscillator 
% fun = @funcvanderpol; x0=[0.1;0.2]; tinic=0; tfin=10; N=1000; par=[]; jac=@jacvanderpol; itmax=10;


% LINEAR BOUNDARY VALUE PROBLEMS

% pqr={@(t) 0, @(t) 4, @(t) -4*t}; tinic=0;tfin=1; N=1000; a=0; b=2; C1=0; C2=0; %4(x(t)-t)

% pqr={@(t) 3, @(t) 2, @(t) 3*cos(t)}; tinic=0;tfin=5; N=1000; a=-2; b=1; C1=0; C2=1; %3x'(t)+2x(t)+3cos(t)

% pqr={@(t) cos(t), @(t) 0, @(t) t}; tinic=0;tfin=10; N=1000; a=-2; b=-1; C1=1; C2=0; %cos(t)x(t)+t

% pqr={@(t) 1-sin(t), @(t) cos(t), @(t) sin(t)}; tinic=0;tfin=10; N=1000; a=-2; b=-1; C1=1; C2=1; %(1-sen(t))x'(t)+cos(t)x(t)+sen(t)

% pqr={@(t) 0, @(t) 4, @(t) -4*t}; tinic=0;tfin=1; N=1000; a=[1,0]; b=[2,2]; C1=2; C2=2; %4(x(t)-t)