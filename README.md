# ODE

Numerical analysis: solutions of ordinary differential equations with Matlab. Comments are in Spanish.


##Functions

**funccorazon.m** - Cardioid

**funcvanderpol.m** - Van der Pol oscillator


##Auxiliar modules

**mispracticas.m** - in every line has an equation and its input values

**misgraficas.m** - to paint the solution


##Initial value problems


###One-step methods 

**mieuler.m** - Euler method


###Multistep methods

**miab4.m** - 4-step Adams-Bashforth method

**mimilne.m** - 4-step Milne method

###Predictor–corrector methods

**mieulertr.m** - Predictor: Euler method, Corrector: Trapezium method

**miab4am3.m** - Predictor: 4-step Adams-Bashforth method, Corrector: 3-step Adams-Moulton method

**mimilsimp.m** - Predictor: 4-step Milne method, Corrector: 2-step Simpson method


#Tests

All of them use the input values and function from mispracticas.m, use a method to solve the problem and misgraficas.m to paint the solution 


**testmieuler.m** - Use mieuler.m

**testmiab4.m** - Use miab4.m

**testmimilne.m** - Use mimilne.m

**testmieulertr.m** - Use mieulertr.m

**testmiab4am3.m** - Use miab4am3.m

**testmimilsimp.m** - Use mimilsimp.m
