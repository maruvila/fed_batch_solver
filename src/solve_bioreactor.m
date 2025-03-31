% Copyright © 2025 Eugenia Vila
%
% Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

function [Xs,Ss,Ps] = solve_bioreactor( constants, initConds , analysisSettings) ;

global mu_max Ks Yxs F Sf qp V0

complete=false;

F = constants.F;
Sf = constants.Sf;
mu_max = constants.mu_max;
Yxs = constants.Yxs;
Ks = constants.Ks;
qp = constants.qp;

V0 = initConds.V0;

dt  = analysisSettings.dt;
finalt=analysisSettings.finalt;

t = 0:dt:finalt;

if complete == true

  x0 = [ initConds.X0 ; initConds.S0 ; initConds.P0 ];

  salida = lsode ('balances',x0, t );


  Xs = salida (:, 1);
  Ss = salida (:, 2);
  Ps = salida (:, 3);
  
  figure
  subplot(3,1,1)
  grid on
  plot(t, Xs,'b')
  title ('X vs t')
  
  subplot(3,1,2)
  grid on
  plot(t, Ss,'r')
  title ('S vs t')
  
  subplot(3,1,3)
  plot(t, Ps,'g')
  title ('P vs t')
  grid on
  %~ legend('X','S','P')

else
  global tQS
  tQS = 10;

  % calcular X y S quasi estacionario
  x0 = [ initConds.X0 ; initConds.S0 ];
  
  salida = fsolve('balancesXS',x0 )

  x0 = [ initConds.P0 ];

  global XQS
  XQS = salida(1);
  
  salida = lsode('balancesP',x0,t );

  figure
  grid on
  plot(t, salida,'b')
  title ('P vs t')
  
end


