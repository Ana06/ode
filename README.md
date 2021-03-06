# ODE

Numerical analysis: solutions of ordinary differential equations with Matlab. This project was developed during a university course (Numerical methods) in 2015-2016. Comments are in Spanish, except in [**mispracticas.m**](https://github.com/Ana06/ode/blob/master/mispracticas.m), where the comments are in English.



##Functions

**funccorazon.m** - Cardioid

**funcvanderpol.m** - Van der Pol oscillator

**funcpendulo.m** - Pendulum

**funcpendulolin.m** - Lineal pendulum



##Auxiliar modules

**mispracticas.m** - in every line has an equation and its input values

**misgraficas.m** - to paint the solution



##Initial value problems

###One-step methods 

**mieuler.m** - Euler method

**mirk4.m** - fourth-order Runge-Kutta

**mitrap.m** - Trapezoidal method

**jacrigida** - Jacobian matrix of the equation x'(t) = -50(x(t)-cos(t)) to be used in mitrap.m

**jacvanderpol** - Jacobian matrix of the Van der Pol oscillator equation to be used in mitrap.m


###Multistep methods

**miab4.m** - 4-step Adams-Bashforth method

**mimilne.m** - 4-step Milne method


###Predictor–corrector methods

**mieulertr.m** - Predictor: Euler method, Corrector: Trapezium method

**miab4am3.m** - Predictor: 4-step Adams-Bashforth method, Corrector: 3-step Adams-Moulton method

**mimilsimp.m** - Predictor: 4-step Milne method, Corrector: 2-step Simpson method


###Adaptive algorithms

**mimetadap.m** - Using a one-step method

**mirkf45.m** - Runge-Kutta-Fehlberg method



##Boundary value problems

###Linear boundary value problem

**midisplin.m** - linear boundary value problems for several types of boundary conditions

**fundisplin1.m** - ordinary differential equation used in midisplin.m

**fundisplin2.m** - ordinary differential equation used in midisplin.m


###Nonlinear boundary value problem

**midispnolin.m** - nonlinear boundary value problems for several types of boundary conditions: Dirichlet and Neumann

**midispnolingen.m** - generalization of midispnolin.m which can be use for more types of boundary conditions: Robin

**funcdispnolin.m** - used in midispnolin.m and **midispnolingen.m**



##Tests

All of them use the input values and function from mispracticas.m, use a method to solve the problem and misgraficas.m to paint the solution

**testmiode45.m** - Use Matlab function `ode45`

**testmieuler.m** - Use mieuler.m

**testmirk4.m** - Use mirk4.m

**testmitrap.m** - Use mitrap.m

**testmiab4.m** - Use miab4.m

**testmimilne.m** - Use mimilne.m

**testmieulertr.m** - Use mieulertr.m

**testmiab4am3.m** - Use miab4am3.m

**testmimilsimp.m** - Use mimilsimp.m

**testmimetadap.m** - Use mimetadap.m

**testmirkf45.m** - Use mirkf45.m

**testmidisplin.m** - Use midisplin.m

**testmidispnolin.m** - Use midispnolin.m



## Authors

This project was developed by Ana María Martínez Gómez.



## Licence

Code published under MIT License (see [LICENSE](LICENSE)).
