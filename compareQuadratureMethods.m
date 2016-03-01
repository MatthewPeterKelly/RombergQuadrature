function compareQuadratureMethods(fun,tSpan,tol)
%
% Used for checking rombergQuadrature against matlab's integral command
%

% Check using matlab integral command:
tic
xSoln = integral(fun, tSpan(1), tSpan(2), ...
    'RelTol',tol,'AbsTol',tol,'ArrayValued',true);
timeSoln = toc;

% Compute solution using Romberg Quadrature
tic;
[xRomb, err] = rombergQuadrature(fun,tSpan,tol);
timeRomb = toc;

% Display:
fprintf('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n')
fun %#ok<NOPRT>

fprintf('\nMatlab Integral Function: \n');
fprintf('    cpu time: %4.3e \n', timeSoln);    
for i=1:length(xSoln);
fprintf('    x%d = %16.16f \n',i,xSoln(i));
end
fprintf(' \n');

fprintf('Romberg Quadrature: \n');
fprintf('    cpu time: %4.3e \n', timeRomb);    
for i=1:length(xRomb);
fprintf('    x%d = %16.16f \n',i,xRomb(i));
end
for i=1:length(xRomb);
fprintf('    err%d = %6.6e \n',i,err(i));
end
fprintf(' \n');

fprintf('Target Accuracy: %4.4e \n',tol);
fprintf('Method Difference: \n') 
for i=1:length(xRomb);
fprintf('    dx%d = %6.6e \n',i,abs(xRomb(i)-xSoln(i)));
end
fprintf(' \n');

end