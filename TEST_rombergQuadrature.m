% TEST  --  Romberg Quadrature
%
%

clc; clear;

% A simple test problem
tSpan = [0,3];
fun = @(t)( [sin(t); exp(t)] );
tol = 1e-12;
compareQuadratureMethods(fun,tSpan,tol);



% A harder test problem
tSpan = [0,3];
fun = @(t)( [t.*sin(t); cos(t).*exp(t); exp(-t.^2)] );
tol = 1e-12;
compareQuadratureMethods(fun,tSpan,tol);




% A non-smooth test problem
tSpan = [0,3];
fun = @(t)( [abs(t.*sin(t)); abs(cos(t).*exp(t))] );
tol = 1e-10;
compareQuadratureMethods(fun,tSpan,tol);
